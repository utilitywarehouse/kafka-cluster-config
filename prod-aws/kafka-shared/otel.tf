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

resource "kafka_acl" "otel_collector_topic_otlp_spans_access" {
  resource_name       = "otel.otlp_spans"
  resource_type       = "Topic"
  acl_principal       = "User:CN=otel/collector"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "otel_collector_producer_quota" {
  entity_name               = "User:CN=otel/collector"
  entity_type               = "user"
  config = {
    # limit producing to 5 MB/s
    "producer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}

resource "kafka_acl" "tempo_distributor_topic_otlp_spans_access" {
  resource_name       = "otel.otlp_spans"
  resource_type       = "Topic"
  acl_principal       = "User:CN=otel/tempo-distributor"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "tempo_distributor_group_processor_tempo_access" {
  resource_name       = "processor-tempo"
  resource_type       = "Group"
  acl_principal       = "User:CN=otel/tempo-distributor"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "tempo_distributor_consumer_quota" {
  entity_name               = "User:CN=otel/tempo-distributor"
  entity_type               = "user"
  config = {
    # limit consuming to 5 MB/s
    "consumer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
