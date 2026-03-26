module "billing_adapter" {
  source           = "../../../modules/tls-app"
  cert_common_name = "energy-billing/billing-adapter"
  produce_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_1.name]
}

module "billing_adapter_retry_1" {
  source           = "../../../modules/tls-app"
  cert_common_name = "energy-billing/billing-adapter-retry-1"
  produce_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_2.name]
  consume_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_1.name]
  consume_groups   = ["energy-billing.billing-adapter-retry-1"]
}

module "budget_plan_events_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "energy-billing/budget-plan-events-consumer"
  produce_topics   = [kafka_topic.energy_billing_electronic_payment_events.name]
}

module "billing_adapter_retry_2" {
  source           = "../../../modules/tls-app"
  cert_common_name = "energy-billing/billing-adapter-retry-2"
  produce_topics   = [kafka_topic.internal_energy_billing_billing_adapter_deadletter.name]
  consume_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_2.name]
  consume_groups   = ["energy-billing.billing-adapter-retry-2"]
}