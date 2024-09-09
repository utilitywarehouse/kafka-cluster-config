import {
  to = kafka_topic.account_identity_finance_events_compacted
  id = "account-identity.finance.events.compacted"
}

resource "kafka_topic" "account_identity_finance_events_compacted" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"
    "retention.ms"          = "604800000"
  }
  name               = "account-identity.finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}
