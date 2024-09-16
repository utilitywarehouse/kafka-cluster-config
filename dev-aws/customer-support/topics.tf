resource "kafka_topic" "vulnerability_v7" {
  config = {
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for a day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms" = "-1"
  }
  name               = "customer-support.vulnerability_v7"
  partitions         = 15
  replication_factor = 3
}
