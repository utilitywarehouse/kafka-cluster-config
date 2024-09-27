resource "kafka_topic" "account_identity_account_exceptions_v1" {
  config = {
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.account.exceptions.v1"
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


resource "kafka_topic" "account_identity_supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"
  }
  name               = "account-identity.supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"
  }
  name               = "account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_land_registry_check_events" {
  config = {
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
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
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"
  }
  name               = "account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_land_registry_check_events_test" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"

  }
  name               = "account-identity.land-registry.check.events.test"
  partitions         = 15
  replication_factor = 3
}

module "account_identity_account_exceptions_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_exceptions_events.name]
  consume_groups   = ["account-identity.account-exceptions-events-aws"]
  cert_common_name = "account-platform/account_exceptions_events_indexer"
}

module "account_identity_account_exceptions_v1_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  consume_groups   = ["account-identity.account-exceptions-v1-aws"]
  cert_common_name = "account-platform/account_exceptions_v1_indexer"
}

module "account_identity_land_registry_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_land_registry_check_events.name]
  consume_groups   = ["account-identity.land-registry-aws"]
  cert_common_name = "account-platform/land_registry_indexer"
}