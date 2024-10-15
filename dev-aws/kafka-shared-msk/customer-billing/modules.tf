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
  produce_topics   = [kafka_topic.transition_bex_fulfilment_request.name]
  consume_topics   = [
    kafka_topic.invoice_fulfillment_deadletter.name,
    kafka_topic.internal_invoice_fulfilment_deadletter.name
  ]
  consume_groups   = ["bex.fulfilment-router"]
}

module "mail_sender" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/mail-sender"
  produce_topics = [
    kafka_topic.mail_sender_deadletter.name,
    kafka_topic.mail_sender_reprint_deadletter.name
  ]
  consume_topics = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups = ["bex.mail-sender"]
}

module "invoice_generator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-generator"
  produce_topics   = [kafka_topic.invoice_generator.name]
}

module "invoice_fulfillment" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-fulfillment"
  produce_topics = [
    kafka_topic.invoice_fulfillment.name,
    kafka_topic.internal_bex_fulfilment_retry_1.name,
    kafka_topic.internal_bex_fulfilment_retry_2.name,
    kafka_topic.invoice_fulfillment_deadletter.name,
    kafka_topic.internal_invoice_fulfilment_deadletter.name,
    kafka_topic.internal_bex_bill_regeneration_retry_1.name,
    kafka_topic.internal_bex_bill_regeneration_retry_2.name,
    kafka_topic.internal_bex_bill_regeneration_deadletter.name
  ]
  consume_topics = [
    kafka_topic.transition_bex_fulfilment_request.name,
    kafka_topic.internal_bex_fulfilment_retry_1.name,
    kafka_topic.internal_bex_fulfilment_retry_2.name,
    kafka_topic.internal_bex_bill_regeneration.name,
    kafka_topic.internal_bex_bill_regeneration_retry_1.name,
    kafka_topic.internal_bex_bill_regeneration_retry_2.name
  ]
  consume_groups = [
    "bex.invoice-fulfillment",
    "bex.invoice-fulfilment-retry-1",
    "bex.invoice-fulfilment-retry-2",
    "bex.invoice-fulfillment-regen",
    "bex.invoice-fulfillment-regen-retry-1",
    "bex.invoice-fulfillment-regen-retry-2"
  ]
}

module "dashboard" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bex-dashboard"
  produce_topics = [
    kafka_topic.invoice_fulfillment.name,
    kafka_topic.internal_bex_bill_regeneration.name,
    kafka_topic.transition_bex_fulfilment_request.name
  ]
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

module "bex_invoice_api" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bex-invoice-api"
  produce_topics   = [kafka_topic.bex_invoice_api.name]
  consume_topics   = [(kafka_topic.invoice_generator.name)]
  consume_groups   = ["bex.bex-invoice-api"]
}

module "bex_invoice_producer_sync" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bex-temporary-invoice-producer-sync"
  consume_topics = [
    kafka_topic.bex_invoice_api.name,
    kafka_topic.bex_legacy_invoice_api.name
  ]
  consume_groups = ["bex.bex-invoice-producer-sync"]
}

module "bex_fulfilment_events_replicator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bex-fulfilment-events-replicator"
  produce_topics   = [kafka_topic.public_fulfilment_events.name]
}
