resource "kafka_topic" "account_identity_legacy_account_holder_events_compacted" {
  name               = "account-identity.legacy.account.holder.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
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
  cert_common_name = "account-platform/update-holders-projector"
}

module "account_identity_holders_mapper" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups = [
    "account-identity.account-holders-mapper",
    "account-identity.account-holders-mapper-data-fix"
  ]
  produce_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  cert_common_name = "account-platform/holders_mapper"
}

module "account_identity_legacy_account_holder_compaction" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-holders-events-compaction-relay"]
  produce_topics   = [(kafka_topic.account_identity_legacy_account_holder_events_compacted.name)]
  cert_common_name = "account-platform/legacy-account-holder-compaction"
}
