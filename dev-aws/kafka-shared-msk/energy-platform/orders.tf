resource "kafka_topic" "order_events" {
  name               = "energy-platform.order.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because the order event log is the source of truth for order state
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "bill_gas_record_producer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.bill-gas-record-producer"]
  cert_common_name = "energy-platform/bill-gas-record-producer"
}

module "bill_proximo_provisioning_adapter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.bill-proximo-provisioning-adapter"]
  cert_common_name = "energy-platform/bill-proximo-provisioning-adapter"
}

module "comms_orchestrator" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.comms-orchestrator"]
  cert_common_name = "energy-platform/comms-orchestrator"
}

module "crm_graphql_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.crm-graphql-projector"]
  cert_common_name = "energy-platform/crm-graphql-projector"
}

module "billing_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-billing.billing-projector"]
  cert_common_name = "energy-billing/billing-projector"
}

module "energy_bq_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.energy-bq-connector"]
  cert_common_name = "energy-platform/energy-bq-connector"
}

module "ensek_connector_projection" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.ensek-connector-projecion"]
  cert_common_name = "energy-platform/ensek-connector-projecion"
}

module "ev_tariffs_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.ev-tariffs-projector"]
  cert_common_name = "energy-platform/ev-tariffs-projector"
}

module "order_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.order-indexer"]
  cert_common_name = "energy-platform/order-indexer"
}

module "ordering_executor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.ordering-executor"]
  cert_common_name = "energy-platform/ordering-executor"
}

module "service_requests_fixer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.service-request-fixer"]
  cert_common_name = "energy-platform/service-request-fixer"
}

module "unicom_adapter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.unicom-adapter"]
  cert_common_name = "energy-platform/unicom-adapter"
}
