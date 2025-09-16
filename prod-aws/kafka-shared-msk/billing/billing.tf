# Topics
resource "kafka_topic" "fixed_width_file_processing_events" {
  name               = "billing.fixed-width-file-processing-events"
  replication_factor = 3
  partitions         = 2
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "bill_reconciliation_error_events" {
  name               = "billing.bill-reconciliation-error-events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "unified_bill_ready_events" {
  name               = "billing.unified-bill-ready-events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "billing_engine_events_bce_deadletter" {
  name               = "billing.billing-engine-events-bce-deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

# ACLs
module "bill_composition_engine" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.bill_reconciliation_error_events.name,
    kafka_topic.unified_bill_ready_events.name,
    kafka_topic.billing_engine_events_bce_deadletter.name,
  ]
  cert_common_name = "billing/bill-composition-engine"
}

module "bill_adapter" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.fixed_width_file_processing_events.name,
  ]
  cert_common_name = "billing/bill-adapter"
}

module "fixed_width_file_processing_events_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.fixed_width_file_processing_events.name,
  ]
  consume_groups   = ["billing.fixed-width-file-processing-events-indexer"]
  cert_common_name = "billing/fixed-width-file-processing-events-indexer"
}

module "bill_reconciliation_error_events_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.bill_reconciliation_error_events.name,
  ]
  consume_groups   = ["billing.bill-reconciliation-error-events-indexer"]
  cert_common_name = "billing/bill-reconciliation-error-events-indexer"
}

module "unified_bill_ready_events_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.unified_bill_ready_events.name,
  ]
  consume_groups   = ["billing.unified-bill-ready-events-indexer"]
  cert_common_name = "billing/unified-bill-ready-events-indexer"
}

module "billing_engine_events_bce_deadletter_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.billing_engine_events_bce_deadletter.name,
  ]
  consume_groups   = ["billing.billing-engine-events-bce-deadletter-indexer"]
  cert_common_name = "billing/billing-engine-events-bce-deadletter-indexer"
}
