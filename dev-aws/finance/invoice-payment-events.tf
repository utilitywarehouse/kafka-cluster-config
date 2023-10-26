resource "kafka_topic" "invoice_fulfillment" {
  name               = "dd-run.events"
  replication_factor = 3
  partitions         = 10
}
