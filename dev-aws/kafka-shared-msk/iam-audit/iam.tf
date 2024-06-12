resource "kafka_topic" "ingest_v1" {
  name               = "iam-audit.ingest-v1"
  replication_factor = 3
  partitions         = 5
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # keep data in hot storage for 1 days
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "ingest_consumer_v1" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.ingest_v1.name]
  consume_groups   = ["iam-audit.ingest-consumer-v1"]
  cert_common_name = "ingest-iam/ingest-consumer"
}

module "ingest_producer_v1" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.ingest_v1.name]
  cert_common_name = "ingest-iam/ingest-producer"
}
