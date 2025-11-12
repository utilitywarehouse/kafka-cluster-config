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
  name               = "data-infra.bill_integration.bill_telemetry"
  replication_factor = 3
  partitions         = 1
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
  }
}

resource "kafka_topic" "bill_integration_bill_to_kubernetes" {
  name               = "data-infra.bill_integration.bill_to_kubernetes"
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
  }
}

resource "kafka_topic" "bill_integration_kubernetes_to_bill" {
  name               = "data-infra.bill_integration.kubernetes_to_bill"
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
  }
}

resource "kafka_topic" "bill_integration_kubernetes_to_bill_energy_meter_reading" {
  name               = "data-infra.bill_integration.kubernetes_to_bill_energy_meter_reading"
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
  }
}

resource "kafka_topic" "bill_integration_mm2_test" {
  name               = "data-infra.bill_integration.mm2_test"
  replication_factor = 3
  partitions         = 1
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
  }
}

module "di_bill_event_bridge" {
  source = "../../../modules/tls-app"

  produce_topics = [kafka_topic.bill_event_bridge_dlq.name]

  cert_common_name = "bill-integration/bill-event-bridge"
}

module "bill_integration_mm2" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.bill_integration_mm2_test.name,
    kafka_topic.bill_integration_bill_telemetry.name,
    kafka_topic.bill_integration_bill_to_kubernetes.name,
    kafka_topic.bill_integration_kubernetes_to_bill.name,
    kafka_topic.bill_integration_kubernetes_to_bill_energy_meter_reading.name,
  ]

  consume_topics = [
    kafka_topic.bill_integration_mm2_test.name
  ]

  consume_groups = [
    "data-infra.bill-integration.mm2_test",
    "gmm-bill-email-connector",
    "gmm-bill-proximo-metrics-exporter",
    "gmm-payment-bill-remove-card-service",
    "gmm-bill-budget-plan-proximo-reader",
    "gmm-bill-event-reconciler-inbound",
    "gmm-bill-event-reconciler-outbound",
    "gmm-bill-letter-connector",
    "gmm-bill-sms-connector",
    "gmm-equinox-proximo",
    "gmm-gentrack-migration-bill-consumer",
    "gmm-kubernetes-to-bill",
    "gmm-mobile-bill-to-kubernetes-kafka2kafka",
    "gmm-order-platform-bill-application-releaser",
    "gmm-uw-bill-telemetry-bq-connector",
    "gmm-payment-ddm-bill-writer",
    "gmm-telecom-bill-to-kubernetes-kafka2kafka",
  ]

  cert_common_name = "bill-integration/mm2_test"
}
