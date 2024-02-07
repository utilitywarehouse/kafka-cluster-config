resource "kafka_topic" "iam_cerbos_audit_v1" {
  name               = "auth.iam-cerbos-audit-v1"
  replication_factor = 3
  partitions         = 10
  config             = {
    # retain 100MB on each partition
    "retention.bytes"   = "104857600"
    # keep data for 2 days
    "retention.ms"      = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_cerbos_audit_indexer" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_cerbos_audit_v1.name) : "indexer-iam-cerbos-audit-v1" }
  cert_common_name = "auth/iam-cerbos-audit-indexer"
}

module "iam_cerbos_audit_exporter" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_cerbos_audit_v1.name) : "exporter-iam-cerbos-audit-v1" }
  cert_common_name = "auth/iam-cerbos-audit-exporter"
}

