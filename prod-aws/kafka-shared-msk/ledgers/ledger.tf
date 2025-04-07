# Topics
resource "kafka_topic" "account_balance_change_v3" {
  name               = "ledgers.account-balance-change-v3"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # TODO revisit
    # keep data forever
    "retention.ms" = "-1"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "transaction_committed_events" {
  name               = "ledgers.transaction-committed-events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # TODO revisit
    # keep data forever
    "retention.ms" = "-1"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

# ACLs
module "ledger_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.account_balance_change_v3.name,
    kafka_topic.transaction_committed_events.name,
  ]
  cert_common_name = "ledgers/ledger-api"
}
