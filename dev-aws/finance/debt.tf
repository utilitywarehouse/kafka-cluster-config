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

resource "kafka_topic" "debt-comms-diffs-events" {
  name               = "debt-comms-diffs.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "retention.ms"    = "86400000"
    "retention.bytes" = "-1"
  }
}

resource "kafka_topic" "legacy-debt-comms-events" {
  name               = "legacy-debt-comms.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "retention.ms"    = "86400000"
    "retention.bytes" = "-1"
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
