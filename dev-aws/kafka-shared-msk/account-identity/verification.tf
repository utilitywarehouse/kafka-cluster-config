module "account_identity_verification" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_verification.name]
  consume_topics   = [kafka_topic.account_identity_verification.name]
  cert_common_name = "auth-customer/verification-api"
}

resource "kafka_topic" "account_identity_verification" {
  config = {
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
