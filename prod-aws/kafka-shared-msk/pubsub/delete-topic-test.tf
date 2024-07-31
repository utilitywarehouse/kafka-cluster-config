# This is a temporary topic to validate the handling of deleting topics in the MSK runbook
resource "kafka_topic" "test_delete_topic" {
  name               = "test.topic-to-delete"
  replication_factor = 3
  partitions         = 1
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
