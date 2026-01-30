resource "kafka_acl" "msk_data_keep_backup_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/msk-data-keep-backup"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "msk_data_keep_backup_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/msk-data-keep-backup"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

module "msk_data_keep_backup" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["pubsub.msk-data-keep-backup"]
  cert_common_name = "pubsub/msk-data-keep-backup"
}

resource "kafka_topic" "plan_restore" {
  name               = "pubsub.plan-topic-restore"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "msk_data_keep_plan_restore" {
  source         = "../../../modules/tls-app"
  produce_topics = [kafka_topic.plan_restore.name]
  consume_topics = [kafka_topic.plan_restore.name]

  cert_common_name = "pubsub/msk-data-keep-plan-restore"
}

module "msk_data_keep_restore" {
  source         = "../../../modules/tls-app"
  consume_groups = ["pubsub.msk-data-keep-restore"]
  consume_topics = [kafka_topic.plan_restore.name]

  cert_common_name = "pubsub/msk-data-keep-restore"
}

# Enable only when we need to restore
#
# resource "kafka_acl" "msk_data_keep_restore_write_topic_all" {
#   resource_name       = "*"
#   resource_type       = "Topic"
#   acl_principal       = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host            = "*"
#   acl_operation       = "Write"
#   acl_permission_type = "Allow"
# }
