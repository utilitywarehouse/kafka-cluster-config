resource "kafka_topic" "iam_credentials_v1" {
  name               = "auth-customer.iam-credentials-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_acl" "iam_credentials_v1_access" {
  resource_name       = "auth-customer.iam-credentials-v1"
  resource_type       = "Topic"
  acl_principal       = "User:CN=auth-customer/credentials-api"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "iam_credentials_v1_quota" {
  entity_name = "User:CN=auth-customer/credentials-api"
  entity_type = "user"
  config = {
    # limit producing to 5 MB/s
    "producer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
