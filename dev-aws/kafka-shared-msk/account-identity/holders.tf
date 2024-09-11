resource "kafka_topic" "account_identity_legacy_account_holder_events_compacted" {
  name               = "account-identity.legacy.account.holder.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "compact"
  }
}

module "account_identity_update_holders" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.account_identity_legacy_account_holder_events_compacted.name)]
  consume_groups   = ["account-identity.update-holders-projector"]
  cert_common_name = "account-identity/update-holders-projector"
}
