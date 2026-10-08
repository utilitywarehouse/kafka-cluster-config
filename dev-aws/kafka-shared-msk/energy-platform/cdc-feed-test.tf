resource "kafka_topic" "cdc_feed_test_services_event_store" {
  name               = "energy-platform.cdc-feed-test.services-event-store"
  replication_factor = 3
  partitions         = 1
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    "retention.ms"     = "86400000"
  }
}

module "cdc_feed_test_producer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.cdc_feed_test_services_event_store.name]
  cert_common_name = "energy-platform/cdc-feed-test"
}
