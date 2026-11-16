resource "kafka_topic" "bill_event_bridge_dlq" {
  name               = "data-infra.bill_event_bridge.dlq"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "bill_integration_bill_telemetry" {
  name               = "data-infra.bill-integration.bill-telemetry"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "bill_integration_bill_to_kubernetes" {
  name               = "data-infra.bill-integration.bill-to-kubernetes"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "bill_integration_kubernetes_to_bill" {
  name               = "data-infra.bill-integration.kubernetes-to-bill"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "bill_integration_kubernetes_to_bill_energy_meter_reading" {
  name               = "data-infra.bill-integration.kubernetes-to-bill-energy-meter-reading"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}



module "di_bill_event_bridge" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_event_bridge_dlq.name,
    kafka_topic.bill_integration_bill_telemetry.name,
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]

  consume_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
    kafka_topic.bill_integration_kubernetes_to_bill_energy_meter_reading.name,
  ]

  consume_groups = [
    "data-infra.bill-integration.di-bill-event-bridge",
    "data-infra.bill-integration.equinox-proximo"
  ]

  cert_common_name = "bill-integration/bill-event-bridge"
}

module "di_bill_event_bridge_indexer" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
    kafka_topic.bill_integration_kubernetes_to_bill_energy_meter_reading.name,
  ]

  consume_groups = [
    "data-infra.bill-integration.di-bill-event-bridge-indexer"
  ]

  cert_common_name = "bill-integration/bill-event-bridge-indexer"
}

module "customer_support_vulnerability_projector_bill" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name
  ]
  cert_common_name = "crm/vulnerability-projector-bill"
}

module "insurance_bill_adapter" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name
  ]
  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name
  ]
  consume_groups = [
    "insurance.bill-adapter-ingress"
  ]
  cert_common_name = "insurance/bill-adapter"
}

module "di_proximo" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
  ]

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
    kafka_topic.bill_integration_bill_telemetry.name,
  ]

  consume_groups = [
    "data-infra.bill-integration.di-bill-event-bridge",
    "data-infra.bill-integration.equinox-proximo",
    "data-infra.bill-integration.bill-letter-connector",
    "data-infra.bill-integration.bill-email-connector",
    "data-infra.bill-integration.bill-sms-connector",
    "data-infra.bill-integration.order-platform-bill-application-releaser",
    "data-infra.bill-integration.uw-bill-telemetry-bq-connector",
    "data-infra.bill-integration.payment-bill-remove-card-service"
  ]

  cert_common_name = "bill-integration/proximo"
}

module "billing_preference_comment_code_creator" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name
  ]
  cert_common_name = "customer-billing/billing-preference-comment-code-creator"
}

module "unicom_bill_sms_connector" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "unicom.bill-sms-connector"
  ]
  cert_common_name = "unicom/bill_sms_connector"
}

module "unicom_bill_letter_connector" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "unicom.bill-letter-connector"
  ]
  cert_common_name = "unicom/bill_letter_connector"
}

module "unicom_bill_email_connector" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "unicom.bill-email-connector"
  ]
  cert_common_name = "unicom/bill_email_connector"
}

module "debt_payment_plan_api_connector" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name
  ]
  cert_common_name = "debt/debt-payment-plan-api"
}

module "cbc_bill_integration" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
  ]

  cert_common_name = "cbc/cbc-bill-integration-consumer"
}

module "partner" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
  ]

  consume_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]

  consume_groups = [
    "data-infra.bill-integration.bill-event-reconciler-inbound",
    "data-infra.bill-integration.bill-event-reconciler-outbound"
  ]

  cert_common_name = "partner/partner"
}

module "finance_bill_integration" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
  ]

  cert_common_name = "finance/account-in-debt-bill-writer"
}

# Payments services moving off the in-cluster bill-integration Kafka and
# Proximo as direct MSK clients (DI-2149, DI-2150, DI-2155). Consumer groups
# are mirrored to MSK by the prod-aws bill-integration MM2 + group mirror.
module "payment_platform_banking_payment_ddm_bill_writer" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
  ]
  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.payment-ddm-bill-writer"
  ]
  cert_common_name = "payment-platform-banking/payment-ddm-bill-writer"
}

# Produce only: its input stays on the legacy cluster, so no group.
module "payment_platform_banking_payment_bill_sync_service" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_kubernetes_to_bill.name,
  ]
  cert_common_name = "payment-platform-banking/payment-bill-sync-service"
}

# The service's payment-platform ACLs live in payment-platform/payment.tf.
module "payment_platform_payment_query_service_bill" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.payment-query-service"
  ]
  cert_common_name = "payment-platform/payment-query-service"
}

# bill-to-kubernetes listeners moving off the in-cluster bill-integration
# Kafka/Proximo as direct MSK clients. Groups keep the in-cluster name with the
# data-infra.bill-integration. prefix; the prod-aws MM2 + group mirror carries
# the offsets over.
module "clubhouse_comms_events_router" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.bill-sms-connector"
  ]
  cert_common_name = "clubhouse/comms-events-router"
}

module "customer_billing_bill_budget_plan_proximo_reader" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.bill-budget-plan-proximo-reader"
  ]
  cert_common_name = "customer-billing/bill-budget-plan-proximo-reader"
}

module "partner_commission_commission_statements_dispatcher" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.commission-statements"
  ]
  cert_common_name = "partner-commission/commission-statements-dispatcher"
}

module "energy_bill_to_kubernetes_proxy" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.bill-to-kubernetes-energy-proxy"
  ]
  cert_common_name = "energy/bill-to-kubernetes-proxy"
}

# Same CN as the energy-platform/gentrack.tf module; this one only adds the bill-integration ACLs.
module "energy_platform_gentrack_migration_worker_bill" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.gentrack-migration-bill-consumer"
  ]
  cert_common_name = "energy-platform/gentrack-migration-worker"
}

module "customer_billing_invoice_redelivery_orchestrator" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.finance-redelivery-orchestrator"
  ]
  cert_common_name = "customer-billing/invoice-redelivery-orchestrator"
}

module "telecom_bill_to_kubernetes_kafka2kafka" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.telecom-bill-to-kubernetes-kafka2kafka"
  ]
  cert_common_name = "telecom/bill-to-kubernetes-kafka2kafka"
}

# Runs in prod-merit.
module "ordering_platform_bill_application_releaser" {
  source = "../../../modules/tls-app"

  consume_topics = [
    kafka_topic.bill_integration_bill_to_kubernetes.name,
  ]
  consume_groups = [
    "data-infra.bill-integration.order-platform-bill-application-releaser"
  ]
  cert_common_name = "ordering-platform/bill-application-releaser"
}
