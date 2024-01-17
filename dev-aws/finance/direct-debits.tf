resource "kafka_topic" "dd_run_events" {
  name               = "dd-run.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000" #7 days
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "dd_run_reconciliation_events" {
  name               = "dd-run.reconciliation.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "max.message.bytes" = "1048576"
    "retention.bytes" = "-1"
    "retention.ms"    = "259200000" #3 days, maybe worth doing it less
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "invoice_payment_events" {
  name               = "invoice.payment.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" #30 days
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
    "retention.ms"    = "2592000000"
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "dd_file_upload_results_events" {
  name               = "dd-file-upload-results.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}
