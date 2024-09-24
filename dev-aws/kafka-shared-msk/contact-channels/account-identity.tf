# Consume from account-identity.legacy.account.events.compacted
module "legacy_account_events_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/legacy-account-events-consumer"
  consume_topics   = ["account-identity.legacy.account.events.compacted"]
  consume_groups   = ["contact-channels.legacy-account-events-consumer"]
}

