resource "kafka_topic" "bq_staged_events" {
  name               = "bq-staged-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "bq_deadletter_events" {
  name               = "bq-deadletter-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "debt_payment_transaction" {
  name               = "debt-payment-transaction"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "overdue_balance_with_payments_diffs" {
  name               = "overdue-balance-with-payments-diffs"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "failed_payment_confirmation" {
  name               = "failed-payment-confirmation"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}
