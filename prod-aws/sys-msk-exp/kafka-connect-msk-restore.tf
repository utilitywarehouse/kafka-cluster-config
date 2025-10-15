# https://docs.confluent.io/platform/7.8/connect/references/allconfigs.html#distributed-worker-configuration
resource "kafka_topic" "msk_restore_connect_configs" {
  name               = "pubsub.msk-restore.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "msk_restore_connect_offsets" {
  name               = "pubsub.msk-restore.connect-offsets"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "msk_restore_connect_status" {
  name               = "pubsub.msk-restore.connect-status"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}


# https://docs.confluent.io/platform/7.8/connect/security.html#worker-acl-requirements

# Allow Kafka Connect full access to internal topics
module "kafka_connect_full_internal_topics" {
  source           = "../../modules/tls-app"
  produce_topics   = ["pubsub.msk-restore.connect-configs", "pubsub.msk-restore.connect-offsets", "pubsub.msk-restore.connect-status"]
  consume_groups   = ["pubsub.msk-restore-kafka-connect", "pubsub.msk-restore-kafka-connect-worker-group"]
  cert_common_name = "pubsub/sys-msk-exp-restore-kafka-connect"
}

resource "kafka_acl" "kafka_connect_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/sys-msk-exp-restore-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_connect_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/sys-msk-exp-restore-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_connect_write_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/sys-msk-exp-restore-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}
