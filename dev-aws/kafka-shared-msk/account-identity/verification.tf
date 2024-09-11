module "account_identity_verification" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_verification.name]
  consume_topics   = [kafka_topic.account_identity_verification.name]
  cert_common_name = "auth-customer/verification-api"
}

resource "kafka_topic" "account_identity_verification" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # retain data for 3 days
    "retention.ms" = "259200000"
  }
  name               = "account-identity.verification.events.v1"
  partitions         = 3
  replication_factor = 3
}
