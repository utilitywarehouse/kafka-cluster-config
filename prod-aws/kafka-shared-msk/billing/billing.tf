# Topics
resource "kafka_topic" "fixed_width_file_deadletter" {
  name               = "billing.fixed-width-file-deadletter"
  replication_factor = 3
  partitions         = 2
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 7 days
    "local.retention.ms" = "604800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "fixed_width_file_load_errors" {
  name               = "billing.fixed-width-file-load-errors"
  replication_factor = 3
  partitions         = 2
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 7 days
    "local.retention.ms" = "604800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "core_bill_rectifications" {
  name               = "billing.core-bill-rectifications"
  replication_factor = 3
  partitions         = 2
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 7 days
    "local.retention.ms" = "604800000"
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
    "retention.ms" = "-1"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

# ACLs
module "bill_composition_engine" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.fixed_width_file_deadletter.name,
    kafka_topic.fixed_width_file_load_errors.name,
    kafka_topic.core_bill_rectifications.name,
    kafka_topic.unified_bill_ready_events.name,
  ]
  cert_common_name = "billing/bill-composition-engine"
}

module "unified_bill_ready_events_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.unified_bill_ready_events.name,
  ]
  consume_groups   = ["billing.unified-bill-ready-events-indexer"]
  cert_common_name = "billing/unified-bill-ready-events-indexer"
}
