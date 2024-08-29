resource "kafka_topic" "account_events_v2" {
  name               = "account.events.v2"
  replication_factor = 3
  partitions         = 15
}

resource "kafka_topic" "account_atomic_v1" {
  name               = "account.atomic.v1"
  replication_factor = 3
  partitions         = 15
}

