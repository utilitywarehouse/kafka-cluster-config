# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "sledger-eqdb-loader-events" {
  name               = "sledger-eqdb-loader.events"
  replication_factor = 3
  partitions         = 10
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "finance-ledger-entries" {
  name               = "finance-ledger-entries"
  replication_factor = 3
  partitions         = 10
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-balance-diff-events" {
  name               = "account-balance-diff.events"
  replication_factor = 3
  partitions         = 10
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "finance-sledger-transaction-events" {
  name               = "finance-sledger-transaction-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}

# tflint-ignore: terraform_naming_convention
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

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "billing-engine-events-spread-50-filtered-all" {
  name               = "billing-engine-events-spread-50-filtered-all"
  replication_factor = 3
  partitions         = 50
  config = {
    "retention.bytes"   = "-1"
    "retention.ms"      = "-1"
    "compression.type"  = "snappy"
    "cleanup.policy"    = "delete"
    "max.message.bytes" = "104857600"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-balance-change-v1-events" {
  name               = "account-balance-change.v1-events"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "projected-account-balance-change-v1-events" {
  name               = "projected-account-balance-change.v1-events"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-balance-errors" {
  name               = "account-balance.errors"
  partitions         = 10
  replication_factor = 3
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "projected-account-balance-change-v1-events-complete" {
  name               = "projected-account-balance-change.v1-events.complete"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000"
  }
}

resource "kafka_topic" "account_balance_events_compacted" {
  name               = "account-balance-events-compacted"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"    = "compact"
    "max.message.bytes" = "104857600"
    # maximum time a message will remain ineligible for compaction in the log
    "max.compaction.lag.ms" = "172800000" # 2 days
    # how frequently the log compactor will attempt to clean the log
    "min.cleanable.dirty.ratio" = "0.5" # avoid cleaning a log where more than 50% of the log has been compacted
    # period of time after which Kafka will force the log to roll even if the segment file isn't full 
    "segment.ms" = "604800000" # 7 days
    # the segment file size for the log
    "segment.bytes" = "524288000" # 500MB
    # time to retain delete tombstone markers for log compacted topics
    "delete.retention.ms" = "86400000" # 1 day
  }
}
