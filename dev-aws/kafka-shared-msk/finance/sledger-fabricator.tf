resource "kafka_topic" "fabricator_sledger_entries_v1" {
  name               = "finance.fabricator.sledger.entries.v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# ACLs
module "finance_sledger_transaction_fabricator" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.fabricator_sledger_entries_v1.name,
  ]
  cert_common_name = "finance/finance-sledger-transaction-fabricator"
}
