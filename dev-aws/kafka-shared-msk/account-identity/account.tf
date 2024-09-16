resource "kafka_topic" "account_identity_account_events_v2" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
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
    # enable remote storage
    "remote.storage.enable" = "true"
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

module "account_identity_account_atomic_v1_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  consume_groups   = ["account-identity.account-api-atomic-v1-indexer-aws"]
  cert_common_name = "account-platform/account_atomic_v1_indexer"
}

module "account_identity_account_events_v2_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-events-v2-aws"]
  cert_common_name = "account-platform/account_events_v2_indexer"
}

module "account_identity_account_api_account_atomic_producer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  cert_common_name = "account-platform/account_api_account_atomic_producer"
}

module "account_identity_account_atomic_to_internal" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  consume_groups   = ["account-identity.account-atomic-to-legacy-internal"]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  cert_common_name = "account-platform/account_atomic_to_internal"
}

module "account_identity_account_api_atomic_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  consume_groups   = ["account-identity.account-api-atomic-projector-cdb-aws"]
  cert_common_name = "account-platform/account_api_atomic_projector"
}

module "account_identity_account_v2_to_legacy" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-v2-to-legacy-events-relay"]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  cert_common_name = "account-platform/account_v2_to_legacy"
}

module "account_identity_account_api_v2_dispatcher" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_account_events_v2.name]
  cert_common_name = "account-platform/account_api_v2_dispatcher"
}

module "account_identity_create_account_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.create-account-projector-aws"]
  cert_common_name = "account-platform/create_account_projector"
}
