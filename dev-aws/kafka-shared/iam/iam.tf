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
  consume_groups   = ["indexer-iam-cerbos-audit-v1"]
  cert_common_name = "auth/iam-cerbos-audit-indexer"
}

module "iam_cerbos_audit_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_cerbos_audit_v1.name)]
  consume_groups   = ["exporter-iam-cerbos-audit-v1"]
  cert_common_name = "auth/iam-cerbos-audit-exporter"
}

resource "kafka_topic" "iam_credentials_v1" {
  name               = "auth-customer.iam-credentials-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
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
  consume_groups   = ["indexer-iam-credentials-v1"]
  cert_common_name = "auth-customer/iam-credentials-v1-indexer"
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
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
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
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 30 days
    "retention.ms" = "2592000000"
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
  consume_groups   = ["iam-identitydb-snapshotter"]
  cert_common_name = "auth/iam-identitydb-snapshotter"
}

module "iam_identity_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_revoked_v1.name]
  consume_topics   = [(kafka_topic.iam_identitydb_v1.name)]
  consume_groups   = ["iam-identity-api"]
  cert_common_name = "auth/iam-identity-api"
}

module "iam_policy_decision_api" {
  source           = "../../../modules/tls-app"
  cert_common_name = "auth/iam-policy-decision-api"
  produce_topics   = [kafka_topic.iam_cerbos_audit_v1.name]
  consume_topics   = [(kafka_topic.iam_identitydb_v1.name)]
  consume_groups   = ["iam-policy-decision-api"]
}

resource "kafka_topic" "iam_revoked_v1" {
  name               = "auth.iam-revoked-v1"
  replication_factor = 3
  partitions         = 1
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
