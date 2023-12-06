resource "kafka_topic" "vulnerabilities-diffs-events" {
  name               = "vulnerabilities-diffs.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}
