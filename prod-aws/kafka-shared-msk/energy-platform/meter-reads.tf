resource "kafka_topic" "meter_reads" {
  name               = "energy-platform.meter.read.events.v2"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 3 months
    "retention.ms" = "7889238000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "smart_reads_translator" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.meter_reads.name]
  cert_common_name = "energy-platform/smart-reads-translator"
}

module "meter_read_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.meter_reads.name]
  consume_groups   = ["energy-platform.meter-read-events-v2-indexer"]
  cert_common_name = "energy-platform/meter-read-events-indexer"
}

module "meter_reads_fabricator" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.meter_reads.name]
  cert_common_name = "energy-platform/meter-reads-fabricator"
}

module "meter_reads_fabricator_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.meter_reads.name]
  consume_groups   = ["energy-platform.meter-reads-fabricator-projector"]
  cert_common_name = "energy-platform/meter-reads-fabricator-projector"
}

module "meter_reads_api_queue" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.meter_reads.name]
  cert_common_name = "energy-platform/meter-reads-api-queue"
}

module "meter_reads_api_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.meter_reads.name,
    kafka_topic.gentrack_meter_read_events.name,
    kafka_topic.gentrack_market_interactions_events.name
  ]
  consume_groups   = ["energy-platform.meter-reads-api-projector"]
  cert_common_name = "energy-platform/meter-reads-api-projector"
}

module "meter_reads_bq_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.meter_reads.name]
  consume_groups   = ["energy-platform.meter-reads-bq-connector"]
  cert_common_name = "energy-platform/meter-reads-bq-connector"
}

module "crm_adapter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.meter_reads.name]
  consume_groups   = ["energy-platform.crm-adapter"]
  cert_common_name = "energy-platform/crm-adapter"
}

module "bill_reads_producer_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.meter_reads.name]
  consume_groups   = ["energy-platform.bill-reads-producer"]
  cert_common_name = "energy-platform/bill-reads-producer-projector"
}
