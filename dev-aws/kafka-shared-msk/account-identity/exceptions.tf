import {
  to = kafka_topic.account_identity_account_exceptions_v1
  id = "account-identity.account.exceptions.v1"
}

import {
  to = kafka_topic.account_identity_account_exceptions_events
  id = "account-identity.account.exceptions.events"
}

import {
  to = kafka_topic.account_identity_supply_address_exception_check_events
  id = "account-identity.supply.address.exception.check.events"
}

import {
  to = kafka_topic.account_identity_supply_address_debt_exception_check_events
  id = "account-identity.supply.address.debt.exception.check.events"
}

import {
  to = kafka_topic.account_identity_correspondence_address_exception_check_events
  id = "account-identity.correspondence.address.exception.check.events"
}

import {
  to = kafka_topic.account_identity_land_registry_check_events
  id = "account-identity.land-registry.check.events"
}

import {
  to = kafka_topic.account_identity_correspondence_address_debt_exception_check_events
  id = "account-identity.correspondence.address.debt.exception.check.events"
}


resource "kafka_topic" "account_identity_account_exceptions_v1" {
  config = {
    "compression.type" = "zstd"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.account-account.exceptions.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_exceptions_events" {
  config = {
    "compression.type" = "zstd"
    "cleanup.policy"   = "compact"

    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.account.exceptions.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_supply_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"

  }
  name               = "account-identity.supply.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_land_registry_check_events" {
  config = {
    "compression.type" = "zstd"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.land-registry.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_correspondence_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}