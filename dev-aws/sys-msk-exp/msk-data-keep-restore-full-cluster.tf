################################################################
# Enable this configuration when we need to do a FULL cluster restore.
# It gives permissions for the restore app fully on all topics
################################################################

#  Use a variable to enable or disable full cluster restore resources.
#  This allows us to keep the configuration in place for when we need it, without having to rely on git history to bring it back.
variable "enable_restore_full_cluster" {
  type = bool

  description = "Set to true to enable full cluster restore resources, false to disable them."
  default     = true
}

resource "kafka_topic" "plan_restore_full" {
  count              = var.enable_restore_full_cluster ? 1 : 0
  name               = "pubsub.plan-topic-restore"
  replication_factor = 3
  partitions         = 30
  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
    # keep data for 3 days
    "retention.ms" = "259200000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }

  depends_on = [terraform_data.acl_bootstrap]
}

module "msk_data_keep_plan_restore_full" {
  count          = var.enable_restore_full_cluster ? 1 : 0
  source         = "../../modules/tls-app"
  produce_topics = ["pubsub.plan-topic-restore"]
  consume_topics = ["pubsub.plan-topic-restore"]

  cert_common_name = "pubsub/msk-data-keep-plan-restore"

  depends_on = [terraform_data.acl_bootstrap]
}

resource "kafka_acl" "msk_data_keep_restore_write_topic_all" {
  count               = var.enable_restore_full_cluster ? 1 : 0
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/msk-data-keep-restore"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"

  depends_on = [terraform_data.acl_bootstrap]
}

# Needed for determining the resume point
resource "kafka_acl" "msk_data_keep_restore_read_topic_all" {
  count               = var.enable_restore_full_cluster ? 1 : 0
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/msk-data-keep-restore"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"

  depends_on = [terraform_data.acl_bootstrap]
}

resource "kafka_acl" "msk_data_keep_restore_write_groups_all" {
  count         = var.enable_restore_full_cluster ? 1 : 0
  resource_name = "*"
  resource_type = "Group"
  acl_principal = "User:CN=pubsub/msk-data-keep-restore"
  acl_host      = "*"
  # this is non intuitive... we need the Read permission to be able to commit offsets on groups
  acl_operation       = "Read"
  acl_permission_type = "Allow"

  depends_on = [terraform_data.acl_bootstrap]

}

# Reads the live topic list from the real production cluster (kafka-shared-msk)
# and creates them in the sys-msk-exp cluster with the same configuration, so that we can restore data into them.
provider "kafka" {
  alias = "dev"
  bootstrap_servers = [
    "b-1.devenablementpubsubmsk.zfikfc.c4.kafka.eu-west-1.amazonaws.com:9094",
    "b-2.devenablementpubsubmsk.zfikfc.c4.kafka.eu-west-1.amazonaws.com:9094",
    "b-3.devenablementpubsubmsk.zfikfc.c4.kafka.eu-west-1.amazonaws.com:9094",
  ]
}

data "kafka_topics" "dev" {
  count    = var.enable_restore_full_cluster ? 1 : 0
  provider = kafka.dev
}

locals {
  # Exclude the "pubsub." prefixed topics, since those belong to the
  # restore/backup tooling itself (kafka-shared-msk/pubsub/), not application data,
  # Exclude internal "__" and mirror maker topics.
  dev_restore_topics = var.enable_restore_full_cluster ? {
    for t in data.kafka_topics.dev[0].list : t.topic_name => t
    if !startswith(t.topic_name, "pubsub.") && !startswith(t.topic_name, "__") && !startswith(t.topic_name, "mm2") && !strcontains(t.topic_name, "checkpoints.internal")
  } : {}
}

resource "kafka_topic" "dev_restore_topics" {
  for_each = local.dev_restore_topics

  name               = "pubsub.restore-test.${each.value.topic_name}"
  partitions         = each.value.partitions
  replication_factor = each.value.replication_factor
  config             = each.value.config

  depends_on = [terraform_data.acl_bootstrap]
}
