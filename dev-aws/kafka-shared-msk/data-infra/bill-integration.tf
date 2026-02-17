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