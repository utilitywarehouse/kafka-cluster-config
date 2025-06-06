resource "kafka_topic" "notifications_tx" {
  name               = "payment-platform.notifications.tx"
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

module "payment_gateway_report_generator" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.notifications_tx.name,
  ]
  consume_groups   = ["payment-platform.payment-gateway-report-generator"]
  cert_common_name = "payment-platform/payment-gateway-report-generator"
}