resource "kafka_topic" "account_balance_diff_events" {
  name               = "account-balance-diff.events"
  replication_factor = 3
  partitions         = 10
}