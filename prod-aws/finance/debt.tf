resource "kafka_topic" "account-debt-selected-events" {
  name               = "account-debt-selected.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.ms"    = "-1"
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}
