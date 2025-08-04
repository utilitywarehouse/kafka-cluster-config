resource "kafka_topic" "payment_v1_events" {
  name               = "payment-platform.payment.v1.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_method_v1_events" {
  name               = "payment-platform.payment-method.v1.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_method_v2_events" {
  name               = "payment-platform.payment-method.v2.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_deadletter_v1_events" {
  name               = "payment-platform.payment-deadletter.v1.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_method_deadletter_v1_events" {
  name               = "payment-platform.payment-method-deadletter.v1.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

# Downstream integrations
# https://github.com/utilitywarehouse/kubernetes-manifests/blob/master/dev-merit/payment-platform/_configs/platform-integration.yaml
resource "kafka_topic" "payment_v1_public_events_pp_test" {
  name               = "payment-platform.payment.v1.public.events.pp_test"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_v1_public_events_cbc_topup_v3" {
  name               = "payment-platform.payment.v1.public.events.cbc_topup_v3"
  replication_factor = 3
  partitions         = 5 # limiting it to only 5 partitions for dev, can be increased if necessary
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

#All public events will go here. It's meant to be used by ops downstream.
#It should not be consume by a particular domain team.
resource "kafka_topic" "payment_v1_public_events" {
  name               = "payment-platform.payment.v1.public.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_method_v1_public_events" {
  name               = "payment-platform.payment-method.v1.public.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

module "payment_query_service_downstream" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_v1_public_events_pp_test.name,
    kafka_topic.payment_v1_public_events.name,
    kafka_topic.payment_method_v1_public_events.name,
    # integration topics have to go there
    kafka_topic.payment_v1_public_events_cbc_topup_v3.name
  ]
  consume_topics = [
    kafka_topic.payment_v1_events.name,
    kafka_topic.payment_method_v2_events.name,
    kafka_topic.card_v1_internal_payment_methods.name
  ]
  consume_groups   = ["payment-platform.payment_query_service_downstream"]
  cert_common_name = "payment-platform/payment-query-service-downstream"
}

module "payment_query_service" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_deadletter_v1_events.name,
    kafka_topic.payment_v1_events.name,
    kafka_topic.payment_method_deadletter_v1_events.name,
    kafka_topic.payment_v1_public_events_pp_test.name,
    kafka_topic.payment_v1_public_events.name,
    kafka_topic.payment_method_v1_public_events.name,
    # integration topics have to go there
    kafka_topic.payment_v1_public_events_cbc_topup_v3.name
  ]
  consume_topics   = [kafka_topic.payment_v1_events.name, kafka_topic.payment_method_v2_events.name]
  consume_groups   = ["payment-platform.payment_query_service"]
  cert_common_name = "payment-platform/payment-query-service"
}

module "payment_query_service_downstream_preview" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.payment_v1_public_events_pp_test.name,
    kafka_topic.payment_v1_public_events.name,
    kafka_topic.payment_method_v1_public_events.name
  ]
  consume_groups   = ["payment-platform.payment_query_service_downstream_preview"]
  cert_common_name = "payment-platform/payment-query-service-downstream-preview"
}

module "di_kafka_source" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.payment_v1_public_events.name]
  consume_groups   = ["payment-platform.payments-di-kafka"]
  cert_common_name = "payment-platform/payments-di-kafka"
}

module "payment_v1_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["payment-platform.payment.v1.events-indexer"]
  consume_topics   = [kafka_topic.payment_v1_events.name]
  cert_common_name = "payment-platform/payment-v1-events-indexer"
}

module "payment_method_v1_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["payment-platform.payment-method.v1.events-indexer"]
  consume_topics   = [kafka_topic.payment_method_v1_events.name]
  cert_common_name = "payment-platform/payment-method-v1-events-indexer"
}

module "cbc_topup_processor" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["cbc.cbc-topup-processor-v1"]
  consume_topics   = [kafka_topic.payment_v1_public_events_cbc_topup_v3.name]
  cert_common_name = "cbc/cbc-topup-processor"
}


module "kafka_debugger" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.payment_deadletter_v1_events.name, kafka_topic.payment_method_v2_events.name, kafka_topic.payment_v1_events.name]
  cert_common_name = "payment-platform/kafka-debugger"
}