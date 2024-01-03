resource "kafka_topic" "account-debt-selected-events" {
  name               = "account-debt-selected.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.ms"    = "2592000000"
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "failed-debt-notification-events" {
  name               = "failed-debt-notification.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.ms"    = "2592000000"
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "internal-account-debt-events" {
  name               = "internal-account-debt.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "account-debt-events" {
  name               = "account-debt.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.ms"    = "2592000000"
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "debt-collection-events" {
  name = "debt-collection.events"
  replication_factor = 3
  partitions         = 3
  config = {
    "retention.ms"    = "2592000000"
    "retention.bytes" = "-1"
    "cleanup.policy"  = "delete"
  }
}
