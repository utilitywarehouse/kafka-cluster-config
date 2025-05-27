module "payment_platform_banking_deadletterd" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.card_deadletter_v1_internal_payment_methods.name,
  ]
  consume_topics = [
    kafka_topic.card_deadletter_v1_internal_payment_methods.name
  ]
  consume_groups   = ["payment-platform-banking.payment-deadletterd"]
  cert_common_name = "payment-platform-banking/payment-deadletterd"
}