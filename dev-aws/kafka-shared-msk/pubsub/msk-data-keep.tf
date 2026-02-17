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

# Enable only when we need to restore

resource "kafka_topic" "plan_restore_normal" {
  name               = "pubsub.plan-topic-restore.normal"
  replication_factor = 3
  partitions         = 15
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

resource "kafka_topic" "plan_restore_large" {
  name               = "pubsub.plan-topic-restore.large"
  replication_factor = 3
  partitions         = 15
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

module "msk_data_keep_plan_restore" {
  source         = "../../../modules/tls-app"
  produce_topics = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name]
  consume_topics = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name]

  cert_common_name = "pubsub/msk-data-keep-plan-restore"
}

resource "kafka_topic" "restore_test_topic" {
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

module "msk_data_keep_restore" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["pubsub.msk-data-keep-restore.normal", "pubsub.msk-data-keep-restore.large"]
  consume_topics   = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name, kafka_topic.restore_test_topic.name]
  produce_topics   = [kafka_topic.restore_test_topic.name]
  cert_common_name = "pubsub/msk-data-keep-restore"
}


#
# resource "kafka_acl" "msk_data_keep_restore_write_topic_all" {
#   resource_name       = "*"
#   resource_type       = "Topic"
#   acl_principal       = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host            = "*"
#   acl_operation       = "Write"
#   acl_permission_type = "Allow"
# }

# Needed for determining the resume point
# resource "kafka_acl" "msk_data_keep_restore_read_topic_all" {
#   resource_name       = "*"
#   resource_type       = "Topic"
#   acl_principal       = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host            = "*"
#   acl_operation       = "Read"
#   acl_permission_type = "Allow"
# }
