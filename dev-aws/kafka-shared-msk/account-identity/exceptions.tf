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

resource "kafka_topic" "account_identity_supply_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
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
    # enable remote storage
    "remote.storage.enable" = "true"
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
    # enable remote storage
    "remote.storage.enable" = "true"
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
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

module "account_identity_account_to_land_registry_events_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.land-registry-events-relay"]
  produce_topics   = [kafka_topic.account_identity_land_registry_check_events.name]
  cert_common_name = "account-platform/account_to_land_registry_events_relay"
}


module "account_identity_correspondence_address_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-correspondence-address-creation-events-relay"]
  produce_topics   = [kafka_topic.account_identity_correspondence_address_exception_check_events.name]
  cert_common_name = "account-platform/correspondence_address_relay"
}

module "account_identity_internal_supply_address_debt_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-creation-supply-address-debt-events-relay"]
  produce_topics   = [kafka_topic.account_identity_supply_address_debt_exception_check_events.name]
  cert_common_name = "account-platform/internal_supply_address_debt_relay"
}

module "account_identity_supply_address_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-supply-address-creation-events-relay"]
  produce_topics   = [kafka_topic.account_identity_supply_address_exception_check_events.name]
  cert_common_name = "account-platform/supply_address_relay"
}

module "account_identity_supply_address_debt_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-update-supply-address-debt-events-relay"]
  produce_topics   = [kafka_topic.account_identity_supply_address_debt_exception_check_events.name]
  cert_common_name = "account-platform/supply_address_debt_relay"
}

module "account_identity_supply_address_debt_finance_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_finance_events_compacted.name]
  consume_groups   = ["account-identity.finance-supply-address-debt-events-relay-003"]
  produce_topics   = [kafka_topic.account_identity_supply_address_debt_exception_check_events.name]
  cert_common_name = "account-platform/supply_address_debt_finance_relay"
}
# TODO reads from proximo still
# module "account_identity_debt_events_compaction_relay" {
#     source           = "../../../modules/tls-app"
#     consume_topics   = [kafka_topic.account_identity_correspondence_address_debt_exception_check_events.name]
#     consume_groups   = ["account-identity.correspondence-address-debt-events-compaction-relay"]
#     produce_topics   = [kafka_topic.account_identity_correspondence_address_debt_exception_check_events.name]
#     cert_common_name = "account-platform/debt_events_compaction_relay"
# }

module "account_identity_debt_events_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-update-correspondence-address-debt-events-relay"]
  produce_topics   = [kafka_topic.account_identity_correspondence_address_debt_exception_check_events.name]
  cert_common_name = "account-platform/debt_events_relay"
}

module "account_identity_debt_corresp_events_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-creation-corrsep-address-debt-events-relay"]
  produce_topics   = [kafka_topic.account_identity_correspondence_address_debt_exception_check_events.name]
  cert_common_name = "account-platform/debt_corresp_events_relay"
}

module "account_identity_correspondence_address_debt_finance_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_finance_events_compacted.name]
  consume_groups   = ["account-identity.finance-correspondence-address-debt-events-relay-003"]
  produce_topics   = [kafka_topic.account_identity_correspondence_address_debt_exception_check_events.name]
  cert_common_name = "account-platform/correspondence_address_debt_finance_relay"
}

module "account_identity_legacy_correspondence_address_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-correspondence-address-update-events-relay"]
  produce_topics   = [kafka_topic.account_identity_correspondence_address_exception_check_events.name]
  cert_common_name = "account-platform/legacy_correspondence_address_relay"
}

module "account_identity_legacy_supply_address_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-supply-address-update-events-relay"]
  produce_topics   = [kafka_topic.account_identity_supply_address_exception_check_events.name]
  cert_common_name = "account-platform/legacy_supply_address_relay"
}