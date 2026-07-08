################################################################
# Enable this configuration when we need to test the restore app on the EXISTING DEV cluster.
# It gives permissions for the restore app to test topics and consumer groups that are prefixed with "pubsub.restore-test."
# The auth.iam-identitydb-v1 has been chosen as a test topic since it has a small amount of data both in dev and prod.
################################################################

#  Use a variable to enable or disable restore test resources.
#  This allows us to keep the configuration in place for when we need it, without having to rely on git history to bring it back.
variable "enable_restore_test" {
  type        = bool
  description = "Set to true to enable restore test resources, false to disable them."
  default     = true
}
resource "kafka_topic" "plan_restore_test" {
  count              = var.enable_restore_test ? 1 : 0
  name               = "pubsub.plan-topic-restore"
  replication_factor = 3
  partitions         = 5
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
}

resource "kafka_topic" "restore_test_topic" {
  count              = var.enable_restore_test ? 1 : 0
  name               = "pubsub.restore-test.auth.iam-identitydb-v1"
  replication_factor = 3
  # MUST be 1 partition as identitydb assumes this to be true
  partitions = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 1 month
    "retention.ms" = "2592000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 5MiB
    "max.message.bytes" = "5242880"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
module "msk_data_keep_plan_restore" {
  count          = var.enable_restore_test ? 1 : 0
  source         = "../../../modules/tls-app"
  produce_topics = ["pubsub.plan-topic-restore"]
  consume_topics = ["pubsub.plan-topic-restore"]

  cert_common_name = "pubsub/msk-data-keep-plan-restore"
}

module "msk_data_keep_restore" {
  count            = var.enable_restore_test ? 1 : 0
  source           = "../../../modules/tls-app"
  consume_groups   = ["pubsub.msk-data-keep-restore"]
  consume_topics   = ["pubsub.plan-topic-restore"]
  cert_common_name = "pubsub/msk-data-keep-restore"
}

resource "kafka_acl" "msk_data_keep_restore_read_restore_test_topics" {
  count                        = var.enable_restore_test ? 1 : 0
  resource_name                = "pubsub.restore-test."
  resource_type                = "Topic"
  acl_principal                = "User:CN=pubsub/msk-data-keep-restore"
  acl_host                     = "*"
  acl_operation                = "Read"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Prefixed"
}

resource "kafka_acl" "msk_data_keep_restore_write_restore_test_topics" {
  count                        = var.enable_restore_test ? 1 : 0
  resource_name                = "pubsub.restore-test."
  resource_type                = "Topic"
  acl_principal                = "User:CN=pubsub/msk-data-keep-restore"
  acl_host                     = "*"
  acl_operation                = "Write"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Prefixed"
}

resource "kafka_acl" "msk_data_keep_restore_write_restore_test_groups" {
  count         = var.enable_restore_test ? 1 : 0
  resource_name = "pubsub.restore-test."
  resource_type = "Group"
  acl_principal = "User:CN=pubsub/msk-data-keep-restore"
  acl_host      = "*"
  # this is non intuitive... we need the Read permission to be able to commit offsets on groups
  acl_operation                = "Read"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Prefixed"
}
