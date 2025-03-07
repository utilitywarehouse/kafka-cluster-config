resource "kafka_topic" "account_identity_address_lookup_analytics_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "account-identity.address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}
