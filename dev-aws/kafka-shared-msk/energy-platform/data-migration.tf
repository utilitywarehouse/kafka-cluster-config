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

# Stores the cdc-relay's resume cursor (the last resolved CockroachDB timestamp
# it has delivered), so it can resume after a restart without losing changes.
# One partition, compacted: only the latest record per feed key is kept.
resource "kafka_topic" "data_migration_cdc_checkpoint" {
  name               = "energy-platform.data-migration.cdc-checkpoint"
  replication_factor = 3
  partitions         = 1
  config = {
    "cleanup.policy" = "compact"
    # roll segments every hour (1h) so compaction runs promptly; the relay writes a record every few seconds
    "segment.ms"                = "3600000"
    "min.cleanable.dirty.ratio" = "0.1"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
  }
}

module "cdc_relay" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.data_migration_events.name, kafka_topic.data_migration_cdc_checkpoint.name]
  consume_topics   = [kafka_topic.data_migration_cdc_checkpoint.name]
  cert_common_name = "energy-platform/cdc-relay"
}

module "data_feed_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.data_migration_events.name]
  consume_groups   = ["energy-platform.data-feed-projector-observe"]
  cert_common_name = "energy-platform/data-feed-projector"
}
