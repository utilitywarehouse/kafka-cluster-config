resource "kafka_topic" "delete_test" {
  name               = "delete-test"
  replication_factor = 3
  partitions         = 3
  config = {
    # retain 10MB on each partition
    "retention.bytes" = "10485760"
    # keep data for 6 hours
    "retention.ms" = "21600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
