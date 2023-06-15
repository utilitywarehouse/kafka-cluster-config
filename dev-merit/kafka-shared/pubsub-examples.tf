resource "kafka_topic" "pubsub-examples" {
  name               = "pubsub-examples"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
  }
}

resource "kafka_acl" "example-producer_topic_access" {
  resource_name       = "pubsub-examples"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/example-producer"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "example-producer_quota" {
  entity_name               = "User:CN=dev-enablement/example-producer"
  entity_type               = "user"
  config = {
    # limit producing to 5 MB/s
    "producer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}

resource "kafka_acl" "example-consume-process-individually_topic_access" {
  resource_name       = "pubsub-examples"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/example-consume-process-individually"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "example-consume-process-individually_consumer_access" {
  resource_name       = "example-consume-process-individually"
  resource_type       = "Group"
  acl_principal       = "User:CN=dev-enablement/example-consume-process-individually"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "example-consume-process-individually_quota" {
  entity_name               = "User:CN=dev-enablement/example-consume-process-individually"
  entity_type               = "user"
  config = {
    # limit consuming to 5 MB/s
    "consumer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
