resource "kafka_topic" "account_identity_finance_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "account-identity.finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}

module "account_identity_debt_events_compaction_relay" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_finance_events_compacted.name]
  cert_common_name = "account-platform/debt_events_compaction_relay"
}
