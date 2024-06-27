resource "kafka_topic" "iam_cerbos_audit_v1" {
  name               = "auth.iam-cerbos-audit-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_cerbos_audit_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_cerbos_audit_v1.name)]
  consume_groups   = ["iam.indexer-iam-cerbos-audit-v1"]
  cert_common_name = "auth/iam-cerbos-audit-indexer"
}

module "iam_cerbos_audit_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_cerbos_audit_v1.name)]
  consume_groups   = ["iam.exporter-iam-cerbos-audit-v1"]
  cert_common_name = "auth/iam-cerbos-audit-exporter"
}

resource "kafka_topic" "iam_credentials_v1" {
  name               = "auth-customer.iam-credentials-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_credentials_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_credentials_v1.name]
  cert_common_name = "auth-customer/credentials-api"
}

module "iam_credentials_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_credentials_v1.name)]
  consume_groups   = ["iam.indexer-iam-credentials-v1"]
  cert_common_name = "auth-customer/iam-credentials-v1-indexer"
}

module "iam_credentials_comms_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_credentials_v1.name)]
  consume_groups   = ["iam.credentials-comms-processor"]
  cert_common_name = "auth-customer/credentials-comms-processor"
}

module "iam_customer_auth_provider" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_credentials_v1.name]
  cert_common_name = "clubhouse/auth-provider"
}

resource "kafka_topic" "iam_dpd_v1" {
  name               = "auth-customer.iam-dpd-v1"
  replication_factor = 3
  partitions         = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_dpd_mapper" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_dpd_v1.name]
  consume_topics   = [(kafka_topic.iam_credentials_v1.name)]
  consume_groups   = ["iam.dpd-mapper"]
  cert_common_name = "auth-customer/dpd-mapper"
}

module "iam_dpd_di_kafka_source_customer_login_succeeded" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-login-succeeded"]
  cert_common_name = "auth-customer/di-customer-login-succeeded"
}

module "iam_dpd_di_kafka_source_customer_login_failed" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-login-failed"]
  cert_common_name = "auth-customer/di-customer-login-failed"
}

module "iam_dpd_di_kafka_source_customer_logout_succeeded" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-logout-succeeded"]
  cert_common_name = "auth-customer/di-customer-logout-succeeded"
}

module "iam_dpd_di_kafka_source_customer_logout_failed" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-logout-failed"]
  cert_common_name = "auth-customer/di-customer-logout-failed"
}

module "iam_dpd_di_kafka_source_customer_password_reset_start_succeeded" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-password-reset-start-succeeded"]
  cert_common_name = "auth-customer/di-customer-password-reset-start-succeeded"
}

module "iam_dpd_di_kafka_source_customer_password_reset_start_failed" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-password-reset-start-failed"]
  cert_common_name = "auth-customer/di-customer-password-reset-start-failed"
}

module "iam_dpd_di_kafka_source_customer_password_reset_complete_succeeded" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-password-reset-complete-succeeded"]
  cert_common_name = "auth-customer/di-customer-password-reset-complete-succeeded"
}

module "iam_dpd_di_kafka_source_customer_password_reset_complete_failed" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-password-reset-complete-failed"]
  cert_common_name = "auth-customer/di-customer-password-reset-complete-failed"
}

module "iam_dpd_di_kafka_source_customer_password_change_succeeded" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-password-change-succeeded"]
  cert_common_name = "auth-customer/di-customer-password-change-succeeded"
}

module "iam_dpd_di_kafka_source_customer_password_change_failed" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_dpd_v1.name)]
  consume_groups   = ["iam.di-kafka-source-customer-password-change-failed"]
  cert_common_name = "auth-customer/di-customer-password-change-failed"
}

resource "kafka_topic" "iam_identitydb_v1" {
  name               = "auth.iam-identitydb-v1"
  replication_factor = 3
  # MUST be 1 partition as identitydb assumes this to be true
  partitions = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 30 days
    "retention.ms" = "2592000000"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # allow max 5 MB for a message
    "max.message.bytes" = "5242880"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_identitydb_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_identitydb_v1.name)]
  consume_groups   = ["iam.identitydb-indexer"]
  cert_common_name = "auth/iam-identitydb-indexer"
}

module "iam_jwks_publisher" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_identitydb_v1.name]
  cert_common_name = "auth/iam-jwks-publisher"
}

module "iam_identitydb_event_forwarder" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_identitydb_v1.name]
  consume_topics   = [(kafka_topic.iam_revoked_v1.name)]
  consume_groups   = ["iam.identitydb-event-forwarder"]
  cert_common_name = "auth/iam-identitydb-event-forwarder"
}

module "iam_identitydb_snapshotter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_identitydb_v1.name)]
  consume_groups   = ["iam.iam-identitydb-snapshotter"]
  cert_common_name = "auth/iam-identitydb-snapshotter"
}

module "iam_identity_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_revoked_v1.name]
  consume_topics   = [(kafka_topic.iam_identitydb_v1.name)]
  consume_groups   = ["iam.iam-identity-api"]
  cert_common_name = "auth/iam-identity-api"
}

module "iam_policy_decision_api" {
  source           = "../../../modules/tls-app"
  cert_common_name = "auth/iam-policy-decision-api"
  produce_topics   = [kafka_topic.iam_cerbos_audit_v1.name]
  consume_topics   = [(kafka_topic.iam_identitydb_v1.name)]
  consume_groups   = ["iam.iam-policy-decision-api"]
}

resource "kafka_topic" "iam_revoked_v1" {
  name               = "auth.iam-revoked-v1"
  replication_factor = 3
  partitions         = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}


resource "kafka_topic" "iam_credentials_v1_public" {
  name               = "auth-customer.iam-credentials-v1-public"
  replication_factor = 3
  partitions         = 10
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_credentials_public_events_mapper" {
  source           = "../../../modules/tls-app"
  cert_common_name = "auth-customer/credentials-public-events-mapper"
  produce_topics   = [kafka_topic.iam_credentials_v1_public.name]
  consume_topics   = [(kafka_topic.iam_credentials_v1.name)]
  consume_groups   = ["iam.public-events-mapper-iam-credentials_v1"]
}

module "castle_processor" {
  source           = "../../../modules/tls-app"
  cert_common_name = "auth-customer/castle-processor"
  consume_topics   = [(kafka_topic.iam_credentials_v1.name)]
  consume_groups   = ["iam.castle-processor"]
}


resource "kafka_topic" "iam_account_management_events" {
    name = "auth-customer.iam-account-management-events"
    replication_factor = "3"
    partitions = "15"
    config = {
        
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    }
}

module "iam_accounts_management_service" {
    source = "../../../modules/tls-app"
    cert_common_name = "clubhouse/account-management-service"
    produce_topics = [[kafka_topic.iam_account_management_events.name]]
}

module "iam_accounts_management_projector" {
    source = "../../../modules/tls-app"
    cert_common_name = "clubhouse/account_management-projector"
    produce_topics = [(kafka_topic.iam_account_management_events.name)]
}
