
import {
  to = kafka_topic.account_identity_legacy_account_events_compacted
  id = "account-identity.legacy.account.events.compacted"
}

import {
  to = kafka_topic.account_identity_legacy_account_changelog_events
  id = "account-identity.legacy.account.changelog.events"
}

import {
  to = kafka_topic.account_identity_legacy_account_events
  id = "account-identity.legacy.account.events"
}

import {
  to = kafka_topic.account_identity_legacy_account_change_events_compacted
  id = "account-identity.legacy.account.change.events.compacted"
}

import {
  to = kafka_topic.account_identity_legacy_account_braze_events_compacted
  id = "account-identity.legacy.account.braze.events.compacted"
}

import {
  to = kafka_topic.account_identity_internal_legacy_account_events
  id = "account-identity.internal.legacy.account.events"
}

import {
  to = kafka_topic.account_identity_legacy_account_created_in_bill_events
  id = "account-identity.legacy.account.created.in.bill.events"
}

import {
  to = kafka_topic.account_identity_legacy_account_events_private
  id = "account-identity.legacy.account.events.private"
}

import {
  to = kafka_topic.account_identity_legacy_account_eqdb_events
  id = "account-identity.legacy.account.eqdb.events"
}



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
  }
  name               = "account-identity.legacy.account.events.private"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_legacy_account_eqdb_events" {
  config = {
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "account-identity.legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}
