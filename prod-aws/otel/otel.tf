resource "kafka_topic" "otlp_spans" {
  name               = "otel.otlp_spans"
  replication_factor = 3
  partitions         = 200
  config = {
    # retain 5GB on each partition
    "retention.bytes" = "5368709120"
    # keep data for 12 hours
    "retention.ms" = "43200000"
    # allow max 128 MB for a message
    "max.message.bytes" = "134217728"
    # roll log at 3h max
    "segment.ms" = "10800000"
    # max log size of 250 MB
    "segment.bytes"                  = "262144000"
    "compression.type"               = "zstd"
    "cleanup.policy"                 = "delete"
    "unclean.leader.election.enable" = "false"
  }
}

module "otel_collector" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.otlp_spans.name]
  cert_common_name = "otel/collector"
}

module "otel_collector_web" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.otlp_spans.name]
  cert_common_name = "otel/collector-web"
}

module "tempo_distributor" {
  source           = "../../modules/tls-app"
  consume_topics   = [kafka_topic.otlp_spans.name]
  consume_groups   = ["processor-tempo"]
  cert_common_name = "otel/tempo-distributor"
}
