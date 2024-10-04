resource "kafka_topic" "transactions_auditor_diff_events" {
  name               = "billing.transactions-auditor-diff.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # 805 GB
    "retention.bytes" = "805306368000"
    # 105 MB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 60 days
    "retention.ms"   = "5184000000"
    "cleanup.policy" = "delete"
  }
}

module "transactions_auditor_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.transactions_auditor_diff_events.name,
  ]
  cert_common_name = "billing/transactions-auditor-api"
}

module "transactions_auditor_diff_events_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.transactions_auditor_diff_events.name,
  ]
  consume_groups   = ["billing.transactions-auditor-events-indexer"]
  cert_common_name = "billing/transactions-auditor-events-indexer"
}
