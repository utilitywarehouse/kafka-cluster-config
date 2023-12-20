resource "kafka_topic" "account-status-events" {
  name               = "account-status.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes"   = "-1"
    "retention.ms"      = "7776000000"
    "cleanup.policy"    = "delete"
    "max.message.bytes" = "104857600"
  }
}

resource "kafka_topic" "account-eligibility-changed-events" {
  name               = "account-eligibility-changed.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "max.message.bytes" = "104857600"
  }
}
