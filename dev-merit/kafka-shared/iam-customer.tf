resource "kafka_topic" "iam_customer_v1" {
  name               = "iam-customer-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
  }
}

resource "kafka_acl" "iam_customer_v1_access" {
  resource_name       = "iam-customer-v1"
  resource_type       = "Topic"
  acl_principal       = "User:CN=clubhouse/auth-provider"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "iam_customer_v1_quota" {
  entity_name               = "User:CN=clubhouse/auth-provider"
  entity_type               = "user"
  config = {
    # limit producing to 5 MB/s
    "producer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}

resource "kafka_acl" "indexer_iam_customer_v1_group_access" {
  resource_name       = "indexer-iam-customer-v1"
  resource_type       = "Group"
  acl_principal       = "User:CN=auth/iam-customer-v1-indexer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "indexer_iam_customer_v1_quota" {
  entity_name               = "User:CN=auth/iam-customer-v1-indexer"
  entity_type               = "user"
  config = {
    # limit consuming to 5 MB/s
    "consumer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
