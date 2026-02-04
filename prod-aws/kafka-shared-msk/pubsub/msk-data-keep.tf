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

resource "kafka_topic" "restore_test_charges_events_v1" {
  name = "pubsub.restore-test.cbc.ChargesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"
  }
}

resource "kafka_topic" "restore_test_basket_v1" {
  name               = "pubsub.restore-test.quoting-platform.basket.events.v1"
  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}


module "msk_data_keep_restore" {
  source         = "../../../modules/tls-app"
  consume_groups = ["pubsub.msk-data-keep-restore.normal", "pubsub.msk-data-keep-restore.large"]
  consume_topics = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name,
  kafka_topic.restore_test_charges_events_v1.name, kafka_topic.restore_test_basket_v1.name]
  produce_topics   = [kafka_topic.restore_test_charges_events_v1.name, kafka_topic.restore_test_basket_v1.name]
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

# Needed for determining the resume point
# resource "kafka_acl" "msk_data_keep_restore_read_topic_all" {
#   resource_name       = "*"
#   resource_type       = "Topic"
#   acl_principal       = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host            = "*"
#   acl_operation       = "Read"
#   acl_permission_type = "Allow"
# }
