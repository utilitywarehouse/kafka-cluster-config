# Topics
resource "kafka_topic" "account_balance_events" {
  name               = "ledgers.account-balance.events"
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
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "transaction_events" {
  name               = "ledgers.transaction.events"
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
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "synthetic_account_balance_events" {
  name               = "ledgers.synthetic-account-balance.events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # keep data for 0.5 hours
    "retention.ms" = "1800000"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

# ACLs
module "ledger_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.account_balance_events.name,
    kafka_topic.transaction_events.name,
    kafka_topic.synthetic_account_balance_events.name,
  ]
  cert_common_name = "ledgers/ledger-api"
}

module "ledger_operational" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.account_balance_events.name,
  ]
  consume_topics = [
    kafka_topic.synthetic_account_balance_events.name,
  ]
  consume_groups   = ["ledgers.ledger-operational"]
  cert_common_name = "ledgers/ledger-operational"
}
