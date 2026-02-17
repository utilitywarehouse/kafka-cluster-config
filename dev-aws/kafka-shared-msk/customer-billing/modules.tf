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
  consume_topics = [
    kafka_topic.invoice_fulfillment_deadletter.name,
    kafka_topic.internal_invoice_fulfilment_deadletter.name
  ]
  consume_groups = ["bex.fulfilment-router"]
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

module "email_sender" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/email-sender"
  produce_topics = [
    kafka_topic.email_sender_deadletter.name,
  ]
  consume_topics = [(kafka_topic.invoice_fulfillment.name)]
  consume_groups = ["bex.email-sender"]
}

module "bill_delivery_request_job" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bill-delivery-request-job"
  produce_topics = [
    # bill-delivery-events (currently exists in bitnami)
  ]
  consume_topics = []
  consume_groups = []
}

module "invoice_fulfillment" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-fulfillment"
  produce_topics = [
    kafka_topic.invoice_fulfillment.name,
    kafka_topic.internal_bex_fulfilment_retry_1.name,
    kafka_topic.internal_bex_fulfilment_retry_2.name,
    kafka_topic.internal_bex_fulfilment_large_invoice.name,
    kafka_topic.invoice_fulfillment_deadletter.name,
    kafka_topic.internal_invoice_fulfilment_deadletter.name,
    kafka_topic.internal_bex_bill_regeneration_retry_1.name,
    kafka_topic.internal_bex_bill_regeneration_retry_2.name,
    kafka_topic.internal_bex_bill_regeneration_large_invoice.name,
    kafka_topic.internal_bex_bill_regeneration_deadletter.name
  ]
  consume_topics = [
    kafka_topic.transition_bex_fulfilment_request.name,
    kafka_topic.internal_bex_fulfilment_retry_1.name,
    kafka_topic.internal_bex_fulfilment_retry_2.name,
    kafka_topic.internal_bex_fulfilment_large_invoice.name,
    kafka_topic.internal_bex_bill_regeneration.name,
    kafka_topic.internal_bex_bill_regeneration_retry_1.name,
    kafka_topic.internal_bex_bill_regeneration_retry_2.name,
    kafka_topic.internal_bex_bill_regeneration_large_invoice.name
  ]
  consume_groups = [
    "bex.invoice-fulfillment",
    "bex.invoice-fulfilment-retry-1",
    "bex.invoice-fulfilment-retry-2",
    "bex.invoice-fulfilment-large-invoice",
    "bex.invoice-fulfillment-regen",
    "bex.invoice-fulfillment-regen-retry-1",
    "bex.invoice-fulfillment-regen-retry-2",
    "bex.invoice-fulfillment-regen-large-invoice"
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

module "bex_invoice_producer_sync" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bex-temporary-invoice-producer-sync"
  consume_topics = [
    kafka_topic.bex_legacy_invoice_api.name
  ]
  consume_groups = ["bex.bex-invoice-producer-sync"]
}

module "bex_fulfilment_events_replicator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/bex-fulfilment-events-replicator"
  produce_topics   = [kafka_topic.public_fulfilment_events.name]
}

module "invoice_api" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-api"
  produce_topics   = [kafka_topic.bex_legacy_invoice_api.name]
}

module "billing-preference-comment-code-creator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "customer-billing/billing-preference-comment-code-creator"
  produce_topics = [data-infra.bill-integration.kubernetes-to-bill]
}
