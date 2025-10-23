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


resource "kafka_topic" "restore_service_status_v3" {
  name = "pubsub.restore-test.customer-proposition.service-status.events.v3"

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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}


# https://docs.confluent.io/platform/7.8/connect/security.html#worker-acl-requirements

# Allow Kafka Connect full access to internal topics
module "test_kafka_connect_full_internal_topics" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["pubsub.test-msk-backup.connect-configs", "pubsub.test-msk-backup.connect-offsets", "pubsub.test-msk-backup.connect-status", "pubsub.restore-test.customer-proposition.service-status.events.v3"]
  consume_groups   = ["pubsub.test-msk-backup-kafka-connect", "pubsub.test-msk-backup-kafka-connect-worker-group", "pubsub.test-msk-backup-kafka-connect-debug", "pubsub.test-msk-backup-kafka-connect-frequent"]
  cert_common_name = "pubsub/test-msk-backup-kafka-connect"
}

resource "kafka_acl" "test_kafka_connect_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "test_kafka_connect_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

# Enable only when we need to restore
#
# resource "kafka_acl" "test_kafka_connect_write_topic_all" {
#   resource_name       = "*"
#   resource_type       = "Topic"
#   acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
#   acl_host            = "*"
#   acl_operation       = "Write"
#   acl_permission_type = "Allow"
# }
