resource "kafka_topic" "fwf_load_failures" {
  name               = "fwf-load-failures"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" # 30 days
  }
}
