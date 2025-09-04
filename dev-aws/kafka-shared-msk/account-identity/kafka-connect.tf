module "kafka_connect_read_legacy_account_events" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["account-identity.legacy.account.events"]
  consume_groups   = ["dev-enablement.kafka-connect-consumer-group"]
  cert_common_name = "dev-enablement/kafka-connect"
}

module "qe_tao_read_legacy_account_events" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["account-identity.legacy.account.events"]
  consume_groups   = ["dev-enablement.qe-tao-consumer-group"]
  cert_common_name = "dev-enablement/qe-tao-msk-client"
}
