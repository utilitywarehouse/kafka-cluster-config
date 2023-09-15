resource "kafka_topic" "invoice-fulfillment" {
  name               = "bex.internal.bill_fulfilled"
  partitions         = 3
  replication_factor = 10
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

resource "kafka_acl" "invoice-fulfillment_topic_access" {
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
  acl_principal       = "User:CN=customer-billing/invoice-fulfillment"
  resource_name       = "bex.internal.bill_fulfilled"
  resource_type       = "Topic"
}

resource "kafka_quota" "invoice-fulfillment_quota" {
  entity_name = "User:CN=customer-billing/invoice-fulfillment"
  entity_type = "user"
  config = {
    # limit producing to 5 MB/s
    "producer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
