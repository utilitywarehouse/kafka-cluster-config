resource "kafka_topic" "invoice_delivery_events" {
  name               = "invoice-delivery-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy" = "delete"
  }
}
