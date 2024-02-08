resource "kafka_topic" "comms-eqdb-loader-events" {
  name               = "comms.eqdb-loader.events"
  replication_factor = 3
  partitions         = 1
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "disputes-diffs-v1-events" {
  name               = "disputes-diffs.v1-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}
