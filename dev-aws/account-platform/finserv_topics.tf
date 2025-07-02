resource "kafka_topic" "account_changed_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "account.change.events" # account-change-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "check_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "check.events" # check-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "check_status_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "check.status.events" # account-status-events in finserv
  partitions         = 15
  replication_factor = 3
}
