resource "kafka_topic" "data_migration_events" {
  name               = "energy-platform.data-migration.events"
  replication_factor = 3
  partitions         = 3
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

module "cdc_relay" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.data_migration_events.name]
  cert_common_name = "energy-platform/cdc-relay"
}

module "data_feed_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.data_migration_events.name]
  consume_groups   = ["energy-platform.data-feed-projector-observe"]
  cert_common_name = "energy-platform/data-feed-projector"
}
