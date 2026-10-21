resource "kafka_topic" "order_events" {
  name               = "energy-platform.order.events"
  replication_factor = 3
  partitions         = 3
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# energy-ordering / ordering/executor -- the only producer, also consumes to
# rebuild its own state
module "ordering_executor" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.order_events.name]
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.ordering-executor"]
  cert_common_name = "energy-platform/ordering-executor"
}

# energy-bill-gas-record-producer / provisioning/bill-gas-record-producer
module "bill_gas_record_producer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.bill-gas-record-producer"]
  cert_common_name = "energy-platform/bill-gas-record-producer"
}

# energy-comms-orchestrator / comms/orchestrator
module "comms_orchestrator" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.comms-orchestrator"]
  cert_common_name = "energy-platform/comms-orchestrator"
}

# energy-crm-graphql / crm/graphql
module "crm_graphql_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.crm-graphql-projector"]
  cert_common_name = "energy-platform/crm-graphql-projector"
}

# energy-bq-connector / bigquery-connector
module "energy_bq_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.energy-bq-connector"]
  cert_common_name = "energy-platform/energy-bq-connector"
}

# energy-kafka-forwarder-order-events / kafka-forwarder/order-events
module "energy_kafka_forwarder_order_events" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.energy-kafka-forwarder-order-events"]
  cert_common_name = "energy-platform/energy-kafka-forwarder-order-events"
}

# energy-ensek-connector / ensek-connector/registrations
# NB: the "projecion" typo is the live client name and consumer group
module "ensek_connector_projection" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.ensek-connector-projecion"]
  cert_common_name = "energy-platform/ensek-connector-projecion"
}

# energy-ev-tariffs / ev-tariffs
module "ev_tariffs_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.ev-tariffs-projector"]
  cert_common_name = "energy-platform/ev-tariffs-projector"
}

# energy-platform-events-indexer / elasticsearch/indexers/order-indexer
module "order_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.order-indexer"]
  cert_common_name = "energy-platform/order-indexer"
}

# energy-held-service-request-fixer / provisioning/service-request-fixer
module "service_request_fixer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.service-request-fixer"]
  cert_common_name = "energy-platform/service-request-fixer"
}

# energy-unicom-adapter / comms/unicom-adapter
module "unicom_adapter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-platform.unicom-adapter"]
  cert_common_name = "energy-platform/unicom-adapter"
}

# energy-billing / billing-adapter/projector -- external namespace
module "billing_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events.name]
  consume_groups   = ["energy-billing.billing-projector"]
  cert_common_name = "energy-billing/billing-projector"
}
