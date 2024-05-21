resource "kafka_topic" "legacy_account_events_fwd" {
  name               = "legacy.account.events.fwd"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}
