g proto events from energy-contracts
module "msk_topic_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.tariff_events.name
  ]
  consume_groups   = ["energy-platform.msk-topic-indexer"]
  cert_common_name = "energy-platform/msk-topic-indexer"
}

# topic containing Gentrack proto events from energy-contracts
module "gentrack_topic_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_meter_read_events.name,
    kafka_topic.gentrack_migration_events.name,
    kafka_topic.gentrack_market_interactions_events.name,
    kafka_topic.gentrack_meterpoint_events.name,
    kafka_topic.property_migration_events.name
  ]
  consume_groups   = ["energy-platform.gentrack-topic-indexer"]
  cert_common_name = "energy-platform/gentrack-topic-indexer"
}

# topic containing Gentrack proto events from protobuf-contracts
module "gentrack_topic_indexer_uw" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_billing_events.name,
  ]
  consume_groups   = ["energy-platform.gentrack-topic-indexer-uw"]
  cert_common_name = "energy-platform/gentrack-topic-indexer-uw"
}
