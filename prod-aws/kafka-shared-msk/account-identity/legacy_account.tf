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

import {
  to = kafka_topic.account_identity_legacy_account_braze_events_compacted
  id = "account-identity.legacy.account.braze.events.compacted"
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
  partitions         = 50
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
    # infinite retention
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}

module "account_identity_legacy_dispatcher" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  cert_common_name = "account-platform/legacy_dispatcher"
}

module "account_identity_bill_writer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.bill-writer"]
  cert_common_name = "account-platform/bill_writer"
}

module "account_identity_braze_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_braze_events_compacted.name]
  consume_groups   = ["account-identity.legacy-account-braze-indexer-aws"]
  cert_common_name = "account-platform/braze_events_indexer"
}

module "account_identity_legacy_account_changelog_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_changelog_events.name]
  consume_groups   = ["account-identity.legacy-account-changelog-indexer-aws"]
  cert_common_name = "account-platform/legacy_account_changelog_events_indexer"
}

module "account_identity_legacy_account_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-indexer-aws"]
  cert_common_name = "account-platform/legacy_account_events_indexer"
}

module "account_identity_legacy_account_events_compacted_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events_compacted.name]
  consume_groups   = ["account-identity.legacy-account-compacted-indexer-aws"]
  cert_common_name = "account-platform/legacy_account_events_compacted_indexer"
}

module "account_identity_internal_legacy_account_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-indexer-internal-aws"]
  cert_common_name = "account-platform/internal_legacy_account_indexer"
}

module "account_identity_private_legacy_account_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events_private.name]
  consume_groups   = ["account-identity.legacy-account-indexer-private-aws"]
  cert_common_name = "account-platform/private_legacy_account_indexer"
}

module "account_identity_legacy_account_change_event_uswitch_reporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_change_events_compacted.name]
  consume_groups   = ["account-identity.uswitch-reporter"]
  cert_common_name = "customer-proposition/uswitch-reporter-account-consumer"
}
