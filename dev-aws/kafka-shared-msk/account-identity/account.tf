import {
  to = kafka_topic.account_identity_account_events_v2
  id = "account-identity.account.events.v2"
}

import {
  to = kafka_topic.account_identity_account_atomic_v1
  id = "account-identity.account.atomic.v1"
}

import {
  to = kafka_topic.account_identity_account_unified_events
  id = "account-identity.account.unified.events"
}

import {
  to = kafka_topic.account_identity_dev_account_events_anonymized_v0
  id = "account-identity.dev.account.events.anonymized.v0"
}

import {
  to = kafka_topic.account_identity_from_prod_account_events_anonymized_v0
  id = "account-identity.from-prod.account.events.anonymized.v0"
}

import {
  to = kafka_topic.account_identity_public_account_events
  id = "account-identity.public.account.events"
}

import {
  to = kafka_topic.account_identity_account_management_events
  id = "account-identity.account.management.events"
}

resource "kafka_topic" "account_identity_account_events_v2" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # keep data in hot storage for 3 days
    "local.retention.ms" = "259200000"
  }
  name               = "account-identity.account.events.v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_atomic_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_unified_events" {
  config = {
    "cleanup.policy" = "compact"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.account.unified.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_dev_account_events_anonymized_v0" {
  config = {
    "compression.type" = "zstd"
    # keep data for 3 days
    "retention.ms" = "259200000"
  }
  name               = "account-identity.dev.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_from_prod_account_events_anonymized_v0" {
  config = {
    "compression.type" = "zstd"
    # keep data for 3 days
    "retention.ms" = "259200000"
  }
  name               = "account-identity.from-prod.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_public_account_events" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_management_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.account.management.events"
  partitions         = 15
  replication_factor = 3
}