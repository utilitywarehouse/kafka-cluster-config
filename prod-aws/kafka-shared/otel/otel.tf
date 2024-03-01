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
    "segment.bytes"                  = "262144000"
    "compression.type"               = "zstd"
    "cleanup.policy"                 = "delete"
    "unclean.leader.election.enable" = "false"
  }
}

module "otel_collector" {
  source           = "../../../modules/tls-app-v2"
  produce_topics   = [kafka_topic.otlp_spans.name]
  cert_common_name = "otel/collector"
}

module "tempo_distributor" {
  source           = "../../../modules/tls-app-v2"
  consume_topics   = [(kafka_topic.otlp_spans.name)]
  consume_groups   = ["processor-tempo"]
  cert_common_name = "otel/tempo-distributor"
}

moved {
  from = module.tempo_distributor.kafka_acl.group_acl["otel.otlp_spans"]
  to   = module.tempo_distributor.kafka_acl.group_acl["processor-tempo"]
}
