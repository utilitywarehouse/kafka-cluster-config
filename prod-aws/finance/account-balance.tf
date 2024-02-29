resource "kafka_topic" "sledger-eqdb-loader-events" {
  name               = "sledger-eqdb-loader.events"
  replication_factor = 3
  partitions         = 10
}


resource "kafka_topic" "finance-ledger-entries" {
  name               = "finance-ledger-entries"
  replication_factor = 3
  partitions         = 10
}

resource "kafka_topic" "account-balance-diff-events" {
  name               = "account-balance-diff.events"
  replication_factor = 3
  partitions         = 10
}

resource "kafka_topic" "finance-sledger-transaction-events" {
  name               = "finance-sledger-transaction-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "invalid-sledger-fabricated-txs" {
  name               = "invalid-sledger-fabricated-txs"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "billing-account-events" {
  name               = "billing-account.events"
  replication_factor = 3
  partitions         = 50
  config = {
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "account-balance-change-v2-events" {
  name               = "account-balance-change-v2.events"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"        = "compact"
    "max.message.bytes"     = "104857600"
    "max.compaction.lag.ms" = "1728000000"
  }
}

resource "kafka_topic" "account-balance-change-v1-events" {
  name               = "account-balance-change.v1-events"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"    = "delete"
    "retention.bytes"   = "-1"
    "retention.ms"      = "-1"
    "max.message.bytes" = "104857600"
  }
}

resource "kafka_topic" "projected-account-balance-change-v1-events" {
  name               = "projected-account-balance-change.v1-events"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"    = "delete"
    "retention.bytes"   = "-1"
    "retention.ms"      = "-1"
    "max.message.bytes" = "104857600"
  }
}

resource "kafka_topic" "account-balance-errors" {
  name               = "account-balance.errors"
  partitions         = 10
  replication_factor = 3
}

resource "kafka_topic" "projected-account-balance-change-v1-events-complete" {
  name               = "projected-account-balance-change.v1-events.complete"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
  }
}
