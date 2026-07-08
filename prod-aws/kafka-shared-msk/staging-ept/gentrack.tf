resource "kafka_topic" "gentrack_meter_read_events" {
  name               = "staging-ept.gentrack.meter.read.events"
  replication_factor = 3
  partitions         = 3
  config = {
    # Ephemeral staging topic: only carries messages transiently, 5 minutes
    # retention, no tiered/cold storage.
    "retention.ms"      = "300000"
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "gentrack_market_interactions_events" {
  name               = "staging-ept.gentrack.market_interactions.events"
  replication_factor = 3
  partitions         = 3
  config = {
    # Ephemeral staging topic: only carries messages transiently, 5 minutes
    # retention, no tiered/cold storage.
    "retention.ms"      = "300000"
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
