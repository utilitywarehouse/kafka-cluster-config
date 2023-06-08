resource "kafka_topic" "otlp_spans" {
  name               = "otlp_spans"
  replication_factor = 3
  partitions         = 20
  config = {
    # retain 5GB on each partition
    "retention.bytes" = "5368709120"
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
  }
}

resource "kafka_acl" "otel_collector" {
  resource_name       = "otlp_spans"
  resource_type       = "Topic"
  acl_principal       = "User:CN=otel/collector"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "tempo_distributor" {
  resource_name       = "otlp_spans"
  resource_type       = "Topic"
  acl_principal       = "User:CN=otel/tempo-distributor"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}
