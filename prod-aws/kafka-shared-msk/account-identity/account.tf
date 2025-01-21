resource "kafka_topic" "account_identity_account_events_v2" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
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
    # keep data forever
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_unified_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"
  }
  name               = "account-identity.account.unified.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_public_account_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"

  }
  name               = "account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_management_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    "retention.ms"          = -1 # keep data forever
  }
  name               = "account-identity.account-management-events-green"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "account_identity_to_anonymize_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "account-identity.to.anonymize"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_events_v3" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"

  }
  name               = "account-identity.account.events.v3"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_address_lookup_analytics_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"

  }
  name               = "account-identity.address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_analytics_bill_change_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"

  }
  name               = "account-identity.analytics.bill.change.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_bill_writes_public" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"
  }
  name               = "account-identity.account.bill.writes.public"
  partitions         = 15
  replication_factor = 3
}


resource "kafka_topic" "account_identity_account_history_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.account.history.v1"
  partitions         = 15
  replication_factor = 3
}


module "account_identity_account_history_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_history_v1.name]
  consume_groups   = ["account-identity.account-history-projector"]
  cert_common_name = "account-platform/account_history_projector"
}

moved {
  from = kafka_topic.account_identity_accunt_bill_writes_public
  to   = kafka_topic.account_identity_account_bill_writes_public
}

module "account_identity_account_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_account_atomic_v1.name, kafka_topic.account_identity_account_events_v2.name]
  cert_common_name = "account-platform/account_api"
}

module "account_identity_account_api_business_validation_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-api-business-validation-projector"]
  cert_common_name = "account-platform/account_api_business_validation_projector"
}

module "account_identity_account_api_atomic_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  consume_groups   = ["account-identity.account-api-atomic-projector-cdb"]
  cert_common_name = "account-platform/account_api_atomic_projector"
}

module "account_identity_create_account_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [kafka_topic.account_identity_account_events_v2.name
  ]
  consume_groups = [
    "account-identity.create-account-projector"
  ]
  cert_common_name = "account-platform/create_account_projector"
}


module "account_identity_update_account_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_change_events_compacted.name]
  consume_groups   = ["account-identity.update-account-projector", "account-identity.update-account-projector-person-test"]
  cert_common_name = "account-platform/update_account_projector"
}

module "account_identity_account_api_v2_dispatcher" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_account_events_v2.name]
  cert_common_name = "account-platform/account_api_v2_dispatcher"
}

module "account_identity_account_api_v2" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_account_bill_writes_public.name]
  cert_common_name = "account-platform/account_api_v2"
}

module "account_identity_account_api_v2_customer_bill_writer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-api-v2-customer-bill-writer"]
  produce_topics   = [kafka_topic.account_identity_account_bill_writes_public.name]
  cert_common_name = "account-platform/account_api_v2_customer_bill_writer"
}

module "account_identity_account_api_v2_email_verifier" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-api-v2-email-verifier"]
  cert_common_name = "account-platform/account_api_v2_email_verifier"
}

module "account_identity_account_number_seed_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_unified_events.name]
  consume_groups   = ["account-identity.account-number-seed-projector-source"]
  cert_common_name = "account-platform/account_number_seed_projector"
}

module "account_identity_account_atomic_v1_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  consume_groups   = ["account-identity.account-api-atomic-v1-indexer-aws"]
  cert_common_name = "account-platform/account_atomic_v1_indexer"
}

module "account_identity_account_events_created_in_bill_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_created_in_bill_events.name]
  consume_groups   = ["account-identity.legacy-account-created-in-bill-indexer"]
  cert_common_name = "account-platform/account_events_created_in_bill_indexer"
}

module "account_identity_account_events_v2_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-events-v2-aws", "account-identity.account-events-v2-business-creation-events"]
  cert_common_name = "account-platform/account_events_v2_indexer"
}

module "account_identity_account_events_v3_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v3.name]
  consume_groups   = ["account-identity.account-events-v3-indexer"]
  cert_common_name = "account-platform/account_events_v3_indexer"
}

module "account_identity_unified_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_unified_events.name]
  consume_groups   = ["account-identity.account-unified-events-indexer-aws"]
  cert_common_name = "account-platform/unified_events_indexer"
}

module "account_identity_to_anonymize_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_to_anonymize_events.name]
  consume_groups   = ["account-identity.account-to-anonymize-events-indexer-aws"]
  cert_common_name = "account-platform/to_anonymize_events_indexer"
}

module "account_identity_graphql_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name, kafka_topic.account_identity_account_exceptions_v1.name]
  cert_common_name = "account-platform/graphql_api"
}

module "account_identity_graphql_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name, kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.graphql-projector-aws"]
  cert_common_name = "account-platform/graphql_projector"
}

module "account_identity_home_move_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_unified_events.name]
  consume_groups   = ["account-identity.home-move-prod"]
  cert_common_name = "account-platform/home_move_projector"
}

module "account_identity_account_v2_to_legacy" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-v2-to-legacy-events-relay"]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  cert_common_name = "account-platform/account_v2_to_legacy"
}

module "account_identity_to_anonymize" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.account-v2-to-anonymize-events-relay"]
  produce_topics   = [kafka_topic.account_identity_to_anonymize_events.name]
  cert_common_name = "account-platform/to_anonymize"
}


module "account_identity_account_atomic_to_internal" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  consume_groups   = ["account-identity.account-atomic-to-legacy-internal"]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name]
  cert_common_name = "account-platform/account_atomic_to_internal"
}

module "account_identity_account_api_change_notifier" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_atomic_v1.name]
  consume_groups   = ["account-identity.account-api-change-notifier"]
  cert_common_name = "account-platform/account_api_change_notifier"
}

module "account_identity_account_events_compaction_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["account-identity.legacy-account-change-events-compaction-relay"]
  produce_topics   = [kafka_topic.account_identity_legacy_account_change_events_compacted.name]
  cert_common_name = "account-platform/account_events_compaction_relay"
}

module "account_identity_events_anonymizer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_to_anonymize_events.name]
  consume_groups   = ["account-identity.account-events-anonymizer"]
  cert_common_name = "account-platform/events_anonymizer"
}

# Consume from account-identity.account.unified.events
module "contact_channels_account_events_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/account-events-consumer"
  consume_topics   = [kafka_topic.account_identity_account_unified_events.name]
  consume_groups   = ["contact-channels.account-events-consumer"]
}

# Consume from account-identity.legacy.account.events
module "customer_support_crm" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/account-projector"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["customer-support.account.legacy.events.v01082024"]
}

# Consume from account-identity.legacy.account.events
module "customer_support_crm_idv" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/idv-projector"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name]
  consume_groups   = ["customer-support.idv.projector-001"]
}

module "cbc_fraud_detection_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_public_account_events.name]
  consume_groups   = ["account-identity.cbc-fraud-detection-consumer-v1"]
  cert_common_name = "cbc/cbc-fraud-detection-consumer"
}

# Consume from account-identity.account.unified.events
module "quoting_platform_account_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "quoting-platform/account-projector"
  consume_topics   = [kafka_topic.account_identity_account_unified_events.name]
  consume_groups   = ["quoting-platform.account-projector"]
}

module "account_identity_move_out_notifications" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_public_account_events.name]
  produce_topics   = [kafka_topic.account_identity_public_account_events.name]
  consume_groups   = ["account-identity.di-kafka-source-move-out"]
  cert_common_name = "account-platform/di_home_moves"
}
