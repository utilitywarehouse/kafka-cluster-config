resource "kafka_topic" "dd_run_events" {
  name               = "dd-run.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "invoice_payment_events" {
  name               = "invoice.payment.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "invoice_payment_events_filtered" {
  name               = "invoice.payment.events.filtered"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "invoice_payments_reconciliation_errors" {
  name               = "invoice-payments-reconciliation-errors"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "dd_adjustment_errors" {
  name               = "dd-adjustment.errors"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}
