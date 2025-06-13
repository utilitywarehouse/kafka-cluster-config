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
    # keep data in primary storage for 7 days
    "local.retention.ms" = "604800000"
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
    kafka_topic.fixed_width_file_processing_events.name,
  ]
  cert_common_name = "billing/bill-composition-engine"
}

module "fixed_width_file_processing_events_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.fixed_width_file_processing_events.name,
  ]
  consume_groups   = ["billing.fixed-width-file-processing-events-indexer"]
  cert_common_name = "billing/fixed-width-file-processing-events-indexer"
}
