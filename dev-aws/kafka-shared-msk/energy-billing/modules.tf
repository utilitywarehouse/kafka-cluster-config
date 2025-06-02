module "energy_platform" {
  source = "../energy-platform"
}

output "gentrack_billing_events_topic_name" {
  value = energy_platform.gentrack_billing_events_topic_name
}

module "billing_adapter" {
  source           = "../../../modules/tls-app"
  cert_common_name = "energy-billing/billing-adapter"
  produce_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_1.name]
  consume_topics   = [energy_platform.gentrack_billing_events_topic_name]
  consume_groups   = ["energy-billing.billing-adapter"]
}

module "billing_adapter_retry_1" {
  source           = "../../../modules/tls-app"
  cert_common_name = "energy-billing/billing-adapter-retry-1"
  produce_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_2.name]
  consume_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_1.name]
  consume_groups   = ["energy-billing.billing-adapter-retry-1"]
}

module "billing_adapter_retry_2" {
  source           = "../../../modules/tls-app"
  cert_common_name = "energy-billing/billing-adapter-retry-2"
  produce_topics   = [kafka_topic.internal_energy_billing_billing_adapter_deadletter.name]
  consume_topics   = [kafka_topic.internal_energy_billing_billing_adapter_retry_2.name]
  consume_groups   = ["energy-billing.billing-adapter-retry-2"]
}