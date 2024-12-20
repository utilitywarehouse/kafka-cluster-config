module "kafka_connect_read_service_status_events" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["customer-proposition.service-status.events.v3"]
  consume_groups   = ["kafka-connect-group"]
  cert_common_name = "dev-enablement/kafka-connect"
}