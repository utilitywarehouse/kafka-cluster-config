module "banking_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_method_v1_events.name,
    kafka_topic.banking_v1_addacs_instructions.name,
  ]
  cert_common_name = "payment-platform/banking-api"
}

module "banking_consumer" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_method_v1_events.name,
  ]
  consume_topics = [
    kafka_topic.banking_v1_addacs_instructions.name,
  ]
  cert_common_name = "payment-platform/banking-consumer"
}

resource "kafka_topic" "banking_v1_addacs_instructions" {
  name               = "payment-platform.banking.v1.addacs.instructions"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}