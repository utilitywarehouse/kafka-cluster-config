resource "kafka_topic" "payment_v1_events" {
  name               = "payment-platform.payment.v1.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_deadletter_v1_events" {
  name               = "payment-platform.payment-deadletter.v1.events"
  replication_factor = 3
  partitions         = 5 # we don't need more than 5 partitions for deadlettered events
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

module "payment_query_service" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.payment_deadletter_v1_events.name]
  consume_topics   = [kafka_topic.payment_v1_events.name]
  consume_groups   = ["payment-platform.payment_query_service"]
  cert_common_name = "payment-platform/payment-query-service"
}

# Downstream integrations
# https://github.com/utilitywarehouse/kubernetes-manifests/blob/master/prod-aws/payment-platform/_configs/platform-integration.yaml
resource "kafka_topic" "payment_v1_public_events_pp_test" {
  name               = "payment-platform.payments.v1.public.events.pp_test"
  replication_factor = 3
  partitions         = 5 # this is a test/debug topic, not need to have more than 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_v1_public_events_cbc_topup_v3" {
  name               = "payment-platform.payments.v1.public.events.cbc_topup_v3"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

module "payment_query_service_downstream" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_v1_public_events_pp_test.name,
    # integration topics have to go there
    kafka_topic.payment_v1_public_events_cbc_topup_v3.name
  ]
  consume_topics   = [kafka_topic.payment_v1_events.name]
  consume_groups   = ["payment-platform.payment_query_service_downstream"]
  cert_common_name = "payment-platform/payment-query-service-downstream"
}

module "payment_query_service_downstream_preview" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.payment_v1_public_events_pp_test.name]
  consume_groups   = ["payment-platform.payment_query_service_downstream_preview"]
  cert_common_name = "payment-platform/payment-query-service-downstream-preview"
}
