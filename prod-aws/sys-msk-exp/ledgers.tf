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
    # keep data for 1 year
    "retention.ms" = "31556952000"
    # delete old data
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
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
    # keep data for 1 year
    "retention.ms" = "31556952000"
    # delete old data
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "account_migrated_events" {
  name               = "ledgers.account.migrated.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # store data zstd compressed
    "compression.type" = "zstd"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
