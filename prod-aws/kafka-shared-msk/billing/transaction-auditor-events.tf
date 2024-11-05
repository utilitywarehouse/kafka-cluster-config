resource "kafka_topic" "transactions_auditor_diff_events" {
  name               = "billing.transactions-auditor-diff.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # keep on each partition 750GB
    "retention.bytes" = "805306368000"
    # allow for a batch of records maximum 100MB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 2 months
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
