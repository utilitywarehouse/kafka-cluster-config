resource "kafka_topic" "account_identity_finance_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}
