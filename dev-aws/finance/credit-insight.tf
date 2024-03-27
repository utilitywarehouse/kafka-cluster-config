resource "kafka_topic" "credit-insight-account-data-changed-events" {
  name               = "credit-insight-account-data-changed.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" #30 days
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "credit-insight-account-balance-changed-events" {
  name               = "credit-insight-account-balance-changed.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" #30 days
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "credit-insight-account-changed-events" {
  name               = "credit-insight-account-changed.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" #30 days
    "cleanup.policy"  = "delete"
  }
}

# Experimental
resource "kafka_topic" "account-insight-events" {
  name               = "account-insight.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000" #7 days
    "cleanup.policy"  = "delete"
  }
}
