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
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_cerbos_audit_v1.name) : "indexer-iam-cerbos-audit-v1" }
  cert_common_name = "auth/iam-cerbos-audit-indexer"
}

module "iam_cerbos_audit_exporter" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_cerbos_audit_v1.name) : "exporter-iam-cerbos-audit-v1" }
  cert_common_name = "auth/iam-cerbos-audit-exporter"
}

resource "kafka_topic" "iam_credentials_v1" {
  name               = "auth-customer.iam-credentials-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 60 days
    "retention.ms" = "5184000000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_credentials_api" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_credentials_v1.name]
  cert_common_name = "auth-customer/credentials-api"
}

module "iam_credentials_indexer" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_credentials_v1.name) : "indexer-iam-credentials-v1" }
  cert_common_name = "auth-customer/iam-credentials-v1-indexer"
}

module "iam_customer_auth_provider" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_credentials_v1.name]
  cert_common_name = "clubhouse/auth-provider"
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

module "iam_jwks_publisher" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_identitydb_v1.name]
  cert_common_name = "auth/iam-jwks-publisher"
}

module "iam_identitydb_event_forwarder" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_identitydb_v1.name]
  consume_topics   = { (kafka_topic.iam_revoked_v1.name) : "iam-identitydb-event-forwarder" }
  cert_common_name = "auth/iam-identitydb-event-forwarder"
}

module "iam_identitydb_snapshotter" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_identitydb_v1.name) : "iam-identitydb-snapshotter" }
  cert_common_name = "auth/iam-identitydb-snapshotter"
}

module "iam_identity_api" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_revoked_v1.name]
  consume_topics   = { (kafka_topic.iam_identitydb_v1.name) : "iam-identity-api" }
  cert_common_name = "auth/iam-identity-api"
}

module "iam_policy_decision_api" {
  source           = "../../modules/tls-app"
  cert_common_name = "auth/iam-policy-decision-api"
  produce_topics   = [kafka_topic.iam_cerbos_audit_v1.name]
  consume_topics   = { (kafka_topic.iam_identitydb_v1.name) : "iam-policy-decision-api" }
}

resource "kafka_topic" "iam_revoked_v1" {
  name               = "auth.iam-revoked-v1"
  replication_factor = 3
  partitions         = 1
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 60 days
    "retention.ms" = "5184000000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
