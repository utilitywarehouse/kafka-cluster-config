resource "kafka_topic" "account_identity_legacy_account_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "segment.ms"       = "604800000"
    "compression.type" = "zstd"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.legacy.account.events.compacted"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_changelog_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.legacy.account.changelog.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.legacy.account.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_change_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.legacy.account.change.events.compacted"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_braze_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.legacy.account.braze.events.compacted"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_internal_legacy_account_events" {
  config = {
    "cleanup.policy" = "compact"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.internal.legacy.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_created_in_bill_events" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.legacy.account.created.in.bill.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_events_private" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.legacy.account.events.private"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_eqdb_events" {
  config = {
    "compression.type" = "zstd"
    # keep data for 3 days
    "retention.ms" = "259200000"
  }
  name               = "account-identity.legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}

module "account_identity_created_to_unified" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name, kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.unified-accounts-relay-legacy", "account-identity.account-v2-to-legacy-events-relay"]
  produce_topics   = [kafka_topic.account_identity_account_unified_events.name]
  cert_common_name = "account-platform/created_to_unified"
}

module "account_identity_legacy_to_unified" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name, kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.unified-accounts-relay-legacy", "account-identity.unified-accounts-relay-created"]
  produce_topics   = [kafka_topic.account_identity_account_unified_events.name]
  cert_common_name = "account-platform/legacy_to_unified"
}

module "account_identity_legacy_dispatcher" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  cert_common_name = "account-platform/legacy_dispatcher"
}

module "account_identity_graphql_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name, kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/graphql_api"
}
