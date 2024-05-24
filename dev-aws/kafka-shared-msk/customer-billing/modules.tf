module "bills_total_api" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bills-total-api"
  consume_topics   = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups   = ["bex.bills-total-api-reader"]
}

module "billing_fulfilment_public_events_translator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/billing-fulfilment-public-events-translator"
  consume_topics   = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups   = ["bex.billing-fulfilment-public-events-translator"]
}

module "fulfilment_router" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/fulfilment-router"
  consume_topics   = [(kafka_topic.invoice_fulfillment_deadletter.name)]
  consume_groups   = ["bex.fulfilment-router"]
}

module "mail_sender" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/mail-sender"
  produce_topics   = [kafka_topic.mail_sender_deadletter.name]
  consume_topics   = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups   = ["bex.mail-sender"]
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

module "invoice_delivery_orchestrator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-delivery-orchestrator"
  consume_topics   = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups   = ["bex.invoice-delivery-orchestrator"]
}

module "invoice_ready_notifier" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-ready-notifier"
  produce_topics   = [kafka_topic.invoice_ready_notifier_deadletter.name]
  consume_topics   = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups   = ["bex.invoice-ready-notifier"]
}
