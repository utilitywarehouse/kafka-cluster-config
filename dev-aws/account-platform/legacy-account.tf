resource "kafka_topic" "legacy_account_changelog_events" {
  name               = "legacy.account.changelog.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
resource "kafka_topic" "legacy_account_events_compacted" {
  name               = "legacy.account.events.compacted"
  replication_factor = 3
  partitions         = 50
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
resource "kafka_topic" "account_unified_events" {
  name               = "account.unified.events"
  replication_factor = 3
  partitions         = 50
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
resource "kafka_topic" "legacy_account_events" {
  name               = "legacy.account.events"
  replication_factor = 3
  partitions         = 50
}
resource "kafka_topic" "legacy_account_eqdb_events" {
  name               = "legacy.account.eqdb.events"
  replication_factor = 3
  partitions         = 15
}
resource "kafka_topic" "internal_legacy_account_events" {
  name               = "internal.legacy.account.events"
  replication_factor = 3
  partitions         = 15
}
resource "kafka_topic" "legacy_account_events_private" {
  name               = "legacy.account.events.private"
  replication_factor = 3
  partitions         = 15
}
