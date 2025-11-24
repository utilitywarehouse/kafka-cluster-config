resource "kafka_topic" "bundletier_events_compacted_v1" {
  name = "customer-proposition.public.bundletier.events.compacted.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "compact"
  }
}

resource "kafka_topic" "bundletier_events_v1" {
  name = "customer-proposition.public.bundletier.events.v1"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "bundletier_events_compacted_v2" {
  name = "customer-proposition.public.bundletier.events.compacted.v2"

  replication_factor = 3
  partitions         = 15

  config = {
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "compact"
  }
}

resource "kafka_topic" "bundletier_events_v2" {
  name = "customer-proposition.public.bundletier.events.v2"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "bundletier_event_forwarder" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.bundletier_events_compacted_v2.name, kafka_topic.bundletier_events_v2.name]
  consume_groups   = ["customer-proposition.bundletier-public-event-forwarder"]
  cert_common_name = "customer-proposition/bundletier-public-event-forwarder"
}

module "bundletier_csc_cron" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.bundletier_events_compacted_v1.name, kafka_topic.bundletier_events_v1.name]
  cert_common_name = "customer-proposition/bundle-tier-csc-cron"
}

module "es_indexer_bundletier_events_v1" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-bundletier.events.v1"]
  consume_topics   = [kafka_topic.bundletier_events_v1.name]
  cert_common_name = "customer-proposition/es-indexer-bundletier-events-v1"
}

module "es_indexer_bundletier_events_compacted_v1" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-bundletier.events.compacted.v1"]
  consume_topics   = [kafka_topic.bundletier_events_compacted_v1.name]
  cert_common_name = "customer-proposition/es-indexer-bundletier-events-compacted-v1"
}

module "es_indexer_bundletier_events_v2" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-bundletier.events.v2"]
  consume_topics   = [kafka_topic.bundletier_events_v2.name]
  cert_common_name = "customer-proposition/es-indexer-bundletier-events-v2"
}

module "es_indexer_bundletier_events_compacted_v2" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-bundletier.events.compacted.v2"]
  consume_topics   = [kafka_topic.bundletier_events_compacted_v2.name]
  cert_common_name = "customer-proposition/es-indexer-bundletier-events-compacted-v2"
}

module "energy_platform_consumer_bundletier_events_compacted_v1" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["energy-platform.energy-tariff-assignment-events-consumer"]
  consume_topics   = [kafka_topic.bundletier_events_compacted_v1.name]
  cert_common_name = "energy-platform/bundletier-events-consumer"
}
