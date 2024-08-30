import {
  to = kafka_topic.public_account_events
  id = "public.account.events"
}
resource "kafka_topic" "public_account_events" {
  config             = {}
  name               = "public.account.events"
  partitions         = 15
  replication_factor = 3
}

import {
  to = kafka_topic.account_exceptions_events
  id = "account.exceptions.events"
}

resource "kafka_topic" "account_exceptions_events" {
  config = {
    "compression.type" = "snappy"
    "cleanup.policy"   = "compact"
  }
  name               = "account.exceptions.events"
  partitions         = 15
  replication_factor = 3
}

import {
  to = kafka_topic.legacy_account_events_compacted
  id = "legacy.account.events.compacted"
}

resource "kafka_topic" "legacy_account_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    "segment.ms"     = "604800000"
  }
  name               = "legacy.account.events.compacted"
  partitions         = 50
  replication_factor = 3
}

import {
  to = kafka_topic.legacy_account_changelog_events
  id = "legacy.account.changelog.events"
}
resource "kafka_topic" "legacy_account_changelog_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "legacy.account.changelog.events"
  partitions         = 15
  replication_factor = 3
}

import {
  to = kafka_topic.finance_events_compacted
  id = "finance.events.compacted"
}
resource "kafka_topic" "finance_events_compacted" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}

import {
  to = kafka_topic.legacy_account_change_events_compacted
  id = "legacy.account.change.events.compacted"
}
resource "kafka_topic" "legacy_account_change_events_compacted" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "legacy.account.change.events.compacted"
  partitions         = 50
  replication_factor = 3
}

import {
  to = kafka_topic.legacy_account_braze_events_compacted
  id = "legacy.account.braze.events.compacted"
}
resource "kafka_topic" "legacy_account_braze_events_compacted" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "legacy.account.braze.events.compacted"
  partitions         = 50
  replication_factor = 3
}

import {
  to = kafka_topic.internal_legacy_account_events
  id = "internal.legacy.account.events"
}
resource "kafka_topic" "internal_legacy_account_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "internal.legacy.account.events"
  partitions         = 15
  replication_factor = 3
}

import {
  to = kafka_topic.account_unified_events
  id = "account.unified.events"
}
resource "kafka_topic" "account_unified_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "account.unified.events"
  partitions         = 50
  replication_factor = 3
}

import {
  to = kafka_topic.legacy_account_holder_events_compacted
  id = "legacy.account.holder.events.compacted"
}
resource "kafka_topic" "legacy_account_holder_events_compacted" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "legacy.account.holder.events.compacted"
  partitions         = 15
  replication_factor = 3
}
