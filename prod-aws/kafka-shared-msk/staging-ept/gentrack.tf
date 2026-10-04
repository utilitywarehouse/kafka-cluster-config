resource "kafka_topic" "gentrack_meter_read_events" {
  name               = "staging-ept.gentrack.meter.read.events"
  replication_factor = 3
  partitions         = 3
  # Ephemeral staging topic: carries messages transiently (~5 min), no tiered/cold storage.
  config = {
    # keep data for 0.1 hours
    "retention.ms" = "300000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "gentrack_market_interactions_events" {
  name               = "staging-ept.gentrack.market_interactions.events"
  replication_factor = 3
  partitions         = 3
  # Ephemeral staging topic: carries messages transiently (~5 min), no tiered/cold storage.
  config = {
    # keep data for 0.1 hours
    "retention.ms" = "300000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
