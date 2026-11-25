resource "kafka_topic" "eqdb_sync_notifications" {
  name               = "sys-bill-backups.eqdb-sync.notifications"
  replication_factor = 3
  partitions         = 1

  config = {
    # keep data for 2 days
    "retention.ms" = "172800000"
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
