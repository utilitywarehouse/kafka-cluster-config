resource "kafka_topic" "bq_staged_events" {
  name               = "bq-staged-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000"
    "cleanup.policy"  = "delete"
  }
}

