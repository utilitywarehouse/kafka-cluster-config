module "account_identity_verification_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_verification.name]
  cert_common_name = "auth-customer/verification-api"
}

module "account_identity_verification_link_sender" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_verification.name]
  consume_groups   = ["account-identity.verification-link-sender"]
  cert_common_name = "auth-customer/verification-link-sender"
}

module "account_identity_verification_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_verification.name]
  consume_groups   = ["account-identity.ai-verification-events-v1"]
  cert_common_name = "auth-customer/ai-verification-events-v1-indexer"
}

resource "kafka_topic" "account_identity_verification" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # retain data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "account-identity.verification.events.v1"
  partitions         = 3
  replication_factor = 3
}
