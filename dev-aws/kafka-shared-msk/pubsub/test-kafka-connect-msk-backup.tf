# https://docs.confluent.io/platform/7.8/connect/references/allconfigs.html#distributed-worker-configuration
resource "kafka_topic" "test_msk_backup_connect_configs" {
  name               = "pubsub.test-msk-backup.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "test_msk_backup_connect_offsets" {
  name               = "pubsub.test-msk-backup.connect-offsets"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "test_msk_backup_connect_status" {
  name               = "pubsub.test-msk-backup.connect-status"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}


# https://docs.confluent.io/platform/7.8/connect/security.html#worker-acl-requirements

# Allow Kafka Connect full access to internal topics
module "exp_kafka_connect_full_internal_topics" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["pubsub.test-msk-backup.connect-configs", "pubsub.test-msk-backup.connect-offsets", "pubsub.test-msk-backup.connect-status"]
  consume_groups   = ["pubsub.test-msk-backup-kafka-connect", "pubsub.test-msk-backup-kafka-connect-worker-group", "pubsub.test-msk-backup-kafka-connect-debug"]
  cert_common_name = "pubsub/test-msk-backup-kafka-connect"
}

resource "kafka_acl" "exp_kafka_connect_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "exp_kafka_connect_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

# Enable only when we need to restore
#
# resource "kafka_acl" "exp_kafka_connect_write_topic_all" {
#   resource_name       = "*"
#   resource_type       = "Topic"
#   acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
#   acl_host            = "*"
#   acl_operation       = "Write"
#   acl_permission_type = "Allow"
# }
