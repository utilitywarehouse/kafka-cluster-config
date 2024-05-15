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
  consume_topics   = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups   = ["bex.mail-sender"]
}
