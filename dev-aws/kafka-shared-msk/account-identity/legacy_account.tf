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

module "cbc_account_events_relay_v2" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["account-identity.cbc-account-events-relay-v2"]
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  cert_common_name = "cbc/account-events-relay"
}

module "cbc_fraud_detection_consumer_v1" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["account-identity.cbc-fraud-detection-consumer-v1"]
  consume_topics   = [kafka_topic.account_identity_public_account_events.name]
  cert_common_name = "cbc/fraud-detection-consumer"
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

module "account_identity_internal_legacy_account_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-indexer-internal-aws"]
  cert_common_name = "account-platform/internal_legacy_account_indexer"
}

module "account_identity_from_prod_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_from_prod_account_events_anonymized_v0.name]
  consume_groups   = ["account-identity.anonymized-from-prod-events-relay"]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  cert_common_name = "account-platform/from_prod_relay"
}

module "account_identity_private_to_public_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.relay-private-to-public"]
  produce_topics   = [kafka_topic.account_identity_public_account_events.name]
  cert_common_name = "account-platform/private_to_public_relay"
}

module "account_identity_legacy_account_braze_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events_compacted.name]
  consume_groups   = ["account-identity.legacy-account-braze-relay"]
  produce_topics   = [kafka_topic.account_identity_legacy_account_braze_events_compacted.name]
  cert_common_name = "account-platform/legacy_account_braze_relay"
}

module "account_identity_legacy_account_created_in_bill_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_created_in_bill_events.name]
  consume_groups   = ["account-identity.created-in-bill-relay"]
  produce_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  cert_common_name = "account-platform/legacy_account_created_in_bill_relay"
}

module "account_identity_legacy_to_anonymize_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_created_in_bill_events.name]
  consume_groups   = ["account-identity.account-legacy-to-anonymize-events-relay"]
  produce_topics   = [kafka_topic.account_identity_to_anonymize_events.name]
  cert_common_name = "account-platform/legacy_to_anonymize_relay"
}

module "account_identity_legacy_account_differ" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_eqdb_events.name, kafka_topic.account_identity_legacy_account_changelog_events.name]
  consume_groups   = ["account-identity.legacy-account-differ"]
  produce_topics   = [] # also needs bill analytics topic
  cert_common_name = "account-platform/legacy_account_differ"
}

module "account_identity_eqdb_loader" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_legacy_account_eqdb_events.name]
  cert_common_name = "account-platform/eqdb_loader"
}

module "account_identity_legacy_account_mux" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-mux"]
  produce_topics   = [kafka_topic.account_identity_legacy_account_events.name, kafka_topic.account_identity_legacy_account_created_in_bill_events.name]
  cert_common_name = "account-platform/legacy_account_mux"
}

module "account_identity_legacy_account_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_changelog_events.name, kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-projector-aws"]
  cert_common_name = "account-platform/legacy_account_projector"
}

module "account_identity_legacy_account_translator" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_changelog_events.name]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name, kafka_topic.account_identity_legacy_account_events_private.name]
  consume_groups   = ["account-identity.legacy-account-translator"]
  cert_common_name = "account-platform/legacy_account_translator"
}

module "account_identity_bill_writer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  consume_groups   = ["account-identity.bill-writer"]
  cert_common_name = "account-platform/bill_writer"
}

module "account_identity_holders_mapper" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.account-holders-mapper"]
  produce_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  cert_common_name = "account-platform/holders_mapper"
}

module "account_identity_legacy_acount_change_event_uswitch_reporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_change_events_compacted.name]
  consume_groups   = ["account-identity.uswitch-reporter"]
  cert_common_name = "customer-proposition/uswitch-reporter-account-consumer"
}
