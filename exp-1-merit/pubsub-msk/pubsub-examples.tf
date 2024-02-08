resource "kafka_topic" "pubsub_examples" {
  name               = "pubsub.pubsub-examples"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # retain 100MB on each partition
    "retention.bytes" = "-1"
    # keep data for 2 days
    "retention.ms" = "-1"
    # 1 hour hot storage
    "local.retention.ms" = "3600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_acl" "example_producer_topic_access" {
  resource_name       = "pubsub.pubsub-examples"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/example-producer"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "example_producer_quota" {
  entity_name = "User:CN=pubsub/example-producer"
  entity_type = "user"
  config = {
    # limit producing to 5 MB/s
    "producer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}

resource "kafka_acl" "example_consume_process_individually_topic_access" {
  resource_name       = "pubsub.pubsub-examples"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/example-consume-process-individually"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "example_consume_process_individually_group_access" {
  resource_name       = "pubsub.example-consume-process-individually"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/example-consume-process-individually"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "example_consume_process_individually_quota" {
  entity_name = "User:CN=pubsub/example-consume-process-individually"
  entity_type = "user"
  config = {
    # limit consuming to 5 MB/s
    "consumer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}

