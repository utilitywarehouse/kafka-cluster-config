resource "kafka_topic" "dd_run_events" {
  name               = "dd-run.events"
  replication_factor = 3
  partitions         = 10
}

resource "kafka_topic" "inovice_payment_events" {
  name               = "invoice.payment.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"   = "-1"
    "cleanup.policy" = "delete"
  }
}
