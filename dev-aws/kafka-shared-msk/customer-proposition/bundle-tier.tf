resource "kafka_topic" "bundeltier_events_v1" {
  name = "customer-proposition.public.bundeltier.events.v1"

  replication_factor = 3
  partitions         = 15

  config = {

    "retention.bytes" = "-1" # keep on each partition unlimited data

    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "compact"
  }
}

module "bundeltier_event_forwarder" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.bundeltier_events_v1.name]
  consume_groups   = ["customer-proposition.bundletier-public-event-forwarder"]
  cert_common_name = "customer-proposition/bundletier-public-event-forwarder"
}

module "es_indexer_bundletier_events_v1" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-bundeltier.events.v1"]
  consume_topics   = [kafka_topic.bundeltier_events_v1.name]
  cert_common_name = "customer-proposition/es-indexer-bundeltier-events-v1"
}
