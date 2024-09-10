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
    "retention.ms"       = "-1"
    "cleanup.policy"     = "delete"
  }
}


module "transactions-auditor-api" {
  source = "../../../modules/tls-app"
  // consume_topics = [transactions-auditor-events-indexer.name,]
  produce_topics = [
    kafka_topic.transactions-auditor-diff.events.name,
  ]
  // consume_groups   = ["billing.transactions-auditor-events-indexer"]
  cert_common_name = "billing/transactions-auditor-api"
}
