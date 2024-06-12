resource "kafka_topic" "payment_v1_events" {
  name               = "payment-platform.payment.v1.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_deadletter_v1_payments" {
  name               = "payment-platform.payment-deadletter.v1.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}


module "payment_query_service" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.payment_deadletter_v1_events.name]
  consume_topics   = [kafka_topic.payment_v1_events.name]
  consume_groups   = ["payment-platform.payment_query_service"]
  cert_common_name = "payment-platform/payment-query-service"
}