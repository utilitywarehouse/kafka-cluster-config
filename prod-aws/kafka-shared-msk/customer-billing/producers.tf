module "mail_sender" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/mail-sender"
  produce_topics   = [kafka_topic.mail_sender_deadletter.name]
}

module "invoice_generator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-generator"
  produce_topics   = [kafka_topic.invoice_generator.name]
}

module "invoice_fulfillment" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-fulfillment"
  produce_topics   = [kafka_topic.invoice_fulfillment.name, kafka_topic.invoice_fulfillment_deadletter.name]
}

module "dashboard" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bex-dashboard"
  produce_topics   = [kafka_topic.invoice_fulfillment.name]
}
