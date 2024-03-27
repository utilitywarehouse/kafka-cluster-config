resource "kafka_topic" "events" {
  name               = "data-infra.uw.data-infra.product.v1.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # infinite retention
    "retention.ms" = "-1"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "gzip"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "events_send" {
  name               = "data-infra.uw.data-infra.product.v1.eventsend"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # infinite retention
    "retention.ms" = "-1"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "gzip"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "snowplow" {
  name               = "data-infra.uw.data-infra.pubsubbrige.snowplow"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # 5 days
    "retention.ms" = "432000000"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "gzip"
    "cleanup.policy"    = "delete"
  }
}
