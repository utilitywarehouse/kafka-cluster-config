resource "kafka_topic" "meter_reads" {
  name               = "staging-ept.meter.read.events.v2"
  replication_factor = 3
  partitions         = 3
  config = {
    # Ephemeral staging topic: it only carries messages transiently, so keep
    # data for 5 minutes, with no tiered/cold storage.
    "retention.ms"      = "300000"
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "meter_reads_api_queue" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.meter_reads.name]
  cert_common_name = "staging-ept/meter-reads-api-queue"
}

module "meter_reads_api_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.meter_reads.name,
    kafka_topic.gentrack_meter_read_events.name,
    kafka_topic.gentrack_market_interactions_events.name
  ]
  consume_groups   = ["staging-ept.meter-reads-api-projector"]
  cert_common_name = "staging-ept/meter-reads-api-projector"
}
