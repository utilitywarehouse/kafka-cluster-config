resource "kafka_topic" "otlp_spans" {
  name               = "otel.otlp_spans"
  replication_factor = 3
  partitions         = 20
  config = {
    # retain 80GB on each partition
    "retention.bytes" = "85899345920"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow max 128 MB for a message
    "max.message.bytes" = "134217728"
    # roll log at 3h max
    "segment.ms" = "10800000"
    # max log size of 250 MB
    "segment.bytes"    = "262144000"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
    "unclean.leader.election.enable" = "false"
  }
}

module "otel_collector" {
  source = "../../modules/tls-app"
  produce_topics = [kafka_topic.otlp_spans.name]
  cert_common_name = "otel/collector"
}

module "tempo_distributor" {
  source = "../../modules/tls-app"
  consume_topics = {(kafka_topic.otlp_spans.name): "processor-tempo"}
  cert_common_name = "otel/tempo-distributor"
}

moved {
  from = kafka_acl.otel_collector_topic_otlp_spans_access
  to   = module.otel_collector.kafka_acl.producer_acl["otel.otlp_spans"]
}

moved {
  from = kafka_quota.otel_collector_producer_quota
  to   = module.otel_collector.kafka_quota.quota
}

moved {
  from = kafka_acl.tempo_distributor_group_processor_tempo_access
  to   = module.tempo_distributor.kafka_acl.group_acl["otel.otlp_spans"]
}

moved {
  from = kafka_acl.tempo_distributor_topic_otlp_spans_access
  to   = module.tempo_distributor.kafka_acl.topic_acl["otel.otlp_spans"]
}

moved {
  from = kafka_quota.tempo_distributor_consumer_quota
  to   = module.tempo_distributor.kafka_quota.quota
}
