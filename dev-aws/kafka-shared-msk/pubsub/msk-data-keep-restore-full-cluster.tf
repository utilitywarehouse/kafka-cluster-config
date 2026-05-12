################################################################
# Enable this configuration when we need to do a FULL cluster restore.
# It gives permissions for the restore app fully on all topics
################################################################

#  Use a variable to enable or disable full cluster restore resources.
#  This allows us to keep the configuration in place for when we need it, without having to rely on git history to bring it back.
variable "enable_restore_full_cluster" {
  type = bool

  description = "Set to true to enable full cluster restore resources, false to disable them."
  default     = false
}
resource "kafka_topic" "plan_restore_full_normal" {
  count              = var.enable_restore_full_cluster ? 1 : 0
  name               = "pubsub.plan-topic-restore.normal"
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
}

resource "kafka_topic" "plan_restore_full_large" {
  count              = var.enable_restore_full_cluster ? 1 : 0
  name               = "pubsub.plan-topic-restore.large"
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
}


resource "kafka_acl" "msk_data_keep_restore_write_topic_all" {
  count               = var.enable_restore_full_cluster ? 1 : 0
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/msk-data-keep-restore"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
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
}
