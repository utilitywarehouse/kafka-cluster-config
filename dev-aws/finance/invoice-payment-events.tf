resource "kafka_topic" "invoice_fulfillment" {
  name               = "invoice.payment.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.ms" = "604800000"
    "cleanup.policy"   = "delete"
  }
}
