resource "kafka_topic" "credit-bureau-response-events" {
  name               = "credit-bureau-response.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "risk-assessed-events" {
  name               = "risk-assessed.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}