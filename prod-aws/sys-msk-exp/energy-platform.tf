resource "kafka_topic" "eqdb_loader_service" {
  name               = "energy-platform.eqdb-loader.service"
  replication_factor = 3
  partitions         = 1
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms"                        = "64800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "gentrack_meter_read_events" {
  name               = "energy-platform.gentrack.meter.read.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "gentrack_billing_events" {
  name               = "energy-platform.gentrack.billing.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "gentrack_migration_events" {
  name               = "energy-platform.gentrack.migration.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "gentrack_market_interactions_events" {
  name               = "energy-platform.gentrack.market_interactions.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "gentrack_meterpoint_events" {
  name               = "energy-platform.gentrack.meterpoint.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
