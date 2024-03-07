resource "kafka_topic" "mm2_remote_load_test" {
  name               = "pubsub.mm2-load-test"
  replication_factor = 3
  partitions         = 5
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 20GB on each partition, in total 100GB
    "retention.bytes" = "21474836480"
    # retain in local only 10MB to force moving to the remote once the log segment is rolled.
    "local.retention.bytes" = "10485760"

    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
