resource "kafka_topic" "data_staged_events_finance" {
  name               = "billing.DataStagedEventsFinance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # 805 GB
    "retention.bytes" = "805306368000"
    # 105 MB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    "retention.ms"       = "-1"
    "cleanup.policy"     = "delete"
  }
}

resource "kafka_topic" "historical_data_staged_events_finance" {
  name               = "billing.historical-data-staged-events-finance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # 805 GB
    "retention.bytes" = "805306368000"
    # 105 MB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 7 days
    "retention.ms"   = "604800000"
    "cleanup.policy" = "delete"
  }
}
