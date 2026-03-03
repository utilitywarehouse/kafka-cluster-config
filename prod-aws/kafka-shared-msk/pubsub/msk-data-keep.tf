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

################################################################
# Enable this part when we need to do a FULL cluster restore or we need to test the restore app on the EXISTING DEV cluster.
# Contains the plan restore topics part.
################################################################
# resource "kafka_topic" "plan_restore_normal" {
#   name               = "pubsub.plan-topic-restore.normal"
#   replication_factor = 3
#   partitions         = 40
#   config = {
#     "remote.storage.enable" = "true"
#     "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
#     # keep data for 3 days
#     "retention.ms" = "259200000"
#     # allow for a batch of records maximum 100MiB
#     "max.message.bytes" = "104857600"
#     "compression.type"  = "zstd"
#     "cleanup.policy"    = "delete"
#   }
# }
#
# resource "kafka_topic" "plan_restore_large" {
#   name               = "pubsub.plan-topic-restore.large"
#   replication_factor = 3
#   partitions         = 40
#   config = {
#     "remote.storage.enable" = "true"
#     "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
#     # keep data for 3 days
#     "retention.ms" = "259200000"
#     # allow for a batch of records maximum 100MiB
#     "max.message.bytes" = "104857600"
#     "compression.type"  = "zstd"
#     "cleanup.policy"    = "delete"
#   }
# }
#
# module "msk_data_keep_plan_restore" {
#   source         = "../../../modules/tls-app"
#   produce_topics = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name]
#   consume_topics = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name]
#
#   cert_common_name = "pubsub/msk-data-keep-plan-restore"
# }

################################################################
# End of the common section for doing a FULL cluster restore or testing the restore app on the EXISTING DEV cluster.
################################################################


################################################################
# Enable this part only when we need to do a FULL cluster restore.
# It gives permissions for the restore app fully on all topics
################################################################

# module "msk_data_keep_restore" {
#   source         = "../../../modules/tls-app"
#   consume_groups = ["pubsub.msk-data-keep-restore.normal", "pubsub.msk-data-keep-restore.large"]
#   consume_topics = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name]
#
#   cert_common_name = "pubsub/msk-data-keep-restore"
# }

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

# resource "kafka_acl" "msk_data_keep_restore_write_groups_all" {
#   resource_name                = "*"
#   resource_type                = "Group"
#   acl_principal                = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host                     = "*"
#   # this is non intuitive... we need the Read permission to be able to commit offsets on groups
#   acl_operation                = "Read"
#   acl_permission_type          = "Allow"
#   resource_pattern_type_filter = "Prefixed"
# }


################################################################
# End of the section for a FULL cluster restore.
################################################################


################################################################
# Enable this part when we need to test the restore app on the EXISTING DEV cluster.
# It gives permissions for the restore app only on a test topic that we use for restoring.
# The auth.iam-identitydb-v1 has been chosen as it has a small amount of data both in dev and prod.
################################################################

# resource "kafka_topic" "restore_test_topic" {
#   name               = "pubsub.restore-test.auth.iam-identitydb-v1"
#   replication_factor = 3
#   # MUST be 1 partition as identitydb assumes this to be true
#   partitions = 1
#   config = {
#     # Use tiered storage
#     "remote.storage.enable" = "true"
#     # keep on each partition 100MiB
#     "retention.bytes" = "104857600"
#     # keep data for 1 month
#     "retention.ms" = "2592000000"
#     # keep data in primary storage for 2 days
#     "local.retention.ms" = "172800000"
#     # allow for a batch of records maximum 5MiB
#     "max.message.bytes" = "5242880"
#     "compression.type"  = "zstd"
#     "cleanup.policy"    = "delete"
#   }
# }
#
# module "msk_data_keep_restore" {
#   source           = "../../../modules/tls-app"
#   consume_groups   = ["pubsub.msk-data-keep-restore.normal", "pubsub.msk-data-keep-restore.large"]
#   consume_topics   = [kafka_topic.plan_restore_normal.name, kafka_topic.plan_restore_large.name]
#   cert_common_name = "pubsub/msk-data-keep-restore"
# }
#
# resource "kafka_acl" "msk_data_keep_restore_read_restore_topics" {
#   resource_name                = "pubsub.restore-test."
#   resource_type                = "Topic"
#   acl_principal                = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host                     = "*"
#   acl_operation                = "Read"
#   acl_permission_type          = "Allow"
#   resource_pattern_type_filter = "Prefixed"
# }
#
# resource "kafka_acl" "msk_data_keep_restore_write_restore_topics" {
#   resource_name                = "pubsub.restore-test."
#   resource_type                = "Topic"
#   acl_principal                = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host                     = "*"
#   acl_operation                = "Write"
#   acl_permission_type          = "Allow"
#   resource_pattern_type_filter = "Prefixed"
# }
#
# resource "kafka_acl" "msk_data_keep_restore_write_restore_groups" {
#   resource_name = "pubsub.restore-test."
#   resource_type = "Group"
#   acl_principal = "User:CN=pubsub/msk-data-keep-restore"
#   acl_host      = "*"
#   # this is non intuitive... we need the Read permission to be able to commit offsets on groups
#   acl_operation                = "Read"
#   acl_permission_type          = "Allow"
#   resource_pattern_type_filter = "Prefixed"
# }

################################################################
# End of the section for testing the restore app on the EXISTING DEV cluster.
################################################################
