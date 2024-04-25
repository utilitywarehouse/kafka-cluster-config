resource "kafka_topic" "address_lookup_analytics_v1" {
  name               = "address.lookup.analytics.v1"
  replication_factor = 3
  partitions         = 15
}

resource "kafka_topic" "legacy_account_braze_events_compacted" {
  name               = "legacy.account.braze.events.compacted"
  replication_factor = 3
  partitions         = 50
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
