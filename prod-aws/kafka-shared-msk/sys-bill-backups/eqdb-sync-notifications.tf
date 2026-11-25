resource "kafka_topic" "eqdb_sync_notifications" {
  name               = "sys-bill-backups.eqdb-sync.notifications"
  replication_factor = 3
  partitions         = 1

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # kept for a while in case we need to debug something
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# ACLs
module "eqdb_sync_test_client" {
  source = "../../../modules/tls-app"

  produce_topics = [
    kafka_topic.eqdb_sync_notifications.name,
  ]
  cert_common_name = "sys-bill-backups/eqdb-sync-test-client"
}
