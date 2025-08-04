module "banking_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_method_v1_events.name,
    kafka_topic.payment_method_v2_events.name,
  ]
  cert_common_name = "payment-platform/banking-api"
}
