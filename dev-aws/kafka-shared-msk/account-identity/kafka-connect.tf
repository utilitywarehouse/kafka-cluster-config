module "kafka_connect_read_legacy_account_events" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["account-identity.legacy.account.events"]
  consume_groups   = ["dev-enablement.kafka-connect-group"]
  cert_common_name = "dev-enablement/kafka-connect"
}