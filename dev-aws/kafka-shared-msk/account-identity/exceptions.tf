resource "kafka_topic" "account_identity_account_exceptions_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
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

    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
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
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
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
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
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
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_land_registry_check_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
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
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
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

module "account_identity_exceptions_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_exceptions_v1.name, kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-exceptions-processor-source", "account-identity.account-exceptions-processor-creation-events"]
  produce_topics   = [kafka_topic.account_identity_account_exceptions_events.name]
  cert_common_name = "account-platform/exceptions_processor"
}

module "account_identity_exceptions_service_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  consume_groups   = ["account-identity.account-exceptions-service-projector-v1"]
  cert_common_name = "account-platform/exceptions_service_projector"
}

module "account_identity_correspondence_address_debt_checker" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_correspondence_address_debt_exception_check_events.name]
  consume_groups   = ["account-identity.correspondence-address-debt-checker"]
  produce_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/correspondence_address_debt_checker"
}
module "account_identity_land_registry_checker" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_land_registry_check_events.name]
  consume_groups   = ["account-identity.land-registry-checker"]
  produce_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/land_registry_checker"
}

module "account_identity_land_registry_failures_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  consume_groups   = ["account-identity.land-registry-failures-projector"]
  produce_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/land_registry_failures_projector"
}

module "account_identity_land_registry_failures_retrier" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_land_registry_check_events.name]
  cert_common_name = "account-platform/land_registry_failures_retrier"
}

module "account_identity_correspondence_address_matching_checker" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_correspondence_address_exception_check_events.name]
  consume_groups   = ["account-identity.correspondence-address-matching-checker"]
  produce_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/correspondence_address_matching_checker"
}

module "account_identity_supply_address_matching_checker" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_supply_address_exception_check_events.name]
  consume_groups   = ["account-identity.supply-address-matching-checker"]
  produce_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/supply_address_matching_checker"
}

module "account_identity_supply_address_debt_checker" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_supply_address_debt_exception_check_events.name]
  consume_groups   = ["account-identity.supply-address-debt-checker"]
  produce_topics   = [kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/supply_address_debt_checker"
}
