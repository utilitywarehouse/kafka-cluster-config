module "payment_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_method_v1_events.name,
  ]
  cert_common_name = "payment-platform/payment-api"
}

module "payment_api_consumer_payment_method_cancelled" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_method_v1_events.name,
  ]
  cert_common_name = "payment-platform/payment-api-consumer-payment-method-cancelled"
}