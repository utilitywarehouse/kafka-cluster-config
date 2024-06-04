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
resource "kafka_topic" "account-balance-change-v2-events" {
  name               = "account-balance-change-v2.events"
  partitions         = 10
  replication_factor = 3
  config = {
    "cleanup.policy"    = "delete"
    "max.message.bytes" = "104857600"
    "retention.bytes"   = "-1"
    "retention.ms"      = "-1"
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
    "cleanup.policy"            = "compact"
    "max.message.bytes"         = "104857600"
    "max.compaction.lag.ms"     = "7200000"
    "min.cleanable.dirty.ratio" = "0.01"
    "segment.ms"                = "3600000"
    "segment.bytes"             = "524288000"
    "delete.retention.ms"       = "1000"
  }
}
