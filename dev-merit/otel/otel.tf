resource "kafka_topic" "otlp_spans" {
  name               = "otel.otlp_spans"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100GB on each partition
    "retention.bytes" = "107374182400"
    # keep data for 12 hours
    "retention.ms" = "43200000"
    # allow max 128 MB for a message
    "max.message.bytes" = "134217728"
    # roll log at 3h max
    "segment.ms" = "10800000"
    # max log size of 250 MB
    "segment.bytes"    = "262144000"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
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
  source = "../../modules/tls-app"
  consume_topics = [
    kafka_topic.otlp_sampled_spans.name
  ]
  produce_topics   = [kafka_topic.tempo_ingest.name]
  consume_groups   = ["processor-tempo"]
  cert_common_name = "otel/tempo-distributor"
}

resource "kafka_topic" "otlp_sampled_spans" {
  name               = "otel.otlp_sampled_spans"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 50GB on each partition
    "retention.bytes" = "53687091200"
    # keep data for 12 hours
    "retention.ms" = "43200000"
    # allow max 128 MB for a message
    "max.message.bytes" = "134217728"
    # roll log at 3h max
    "segment.ms" = "10800000"
    # max log size of 250 MB
    "segment.bytes"    = "262144000"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
  }
}

module "otel_tail_sampling_collector" {
  source           = "../../modules/tls-app"
  consume_topics   = [kafka_topic.otlp_spans.name]
  produce_topics   = [kafka_topic.otlp_sampled_spans.name]
  consume_groups   = ["otel.tail-sampling-collector"]
  cert_common_name = "otel/tail-sampling-collector"
}

resource "kafka_topic" "tempo_ingest" {
  name               = "otel.tempo_ingest"
  replication_factor = 3
  # This needs to he in sync with the number of replicas in the tempo block builder
  partitions = 3
  config = {
    # retain 100GB on each partition
    "retention.bytes" = "107374182400"
    # keep data for 12 hours
    "retention.ms" = "43200000"
    # allow max 128 MB for a message
    "max.message.bytes" = "134217728"
    # roll log at 3h max
    "segment.ms" = "10800000"
    # max log size of 250 MB
    "segment.bytes"    = "262144000"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
  }
}

# Used by alll services that need to ingest data into tempo: the block builder, the livestore and the metrics generator.
module "tempo_ingest" {
  source         = "../../modules/tls-app"
  consume_topics = [kafka_topic.tempo_ingest.name]
  # putting wildcard as the the blockbuilder and livestore don't have a common group name, but one per pod, until I figure out what it is.
  consume_groups   = ["otel.metrics-generator", "*"]
  cert_common_name = "otel/tempo-ingest"
}
