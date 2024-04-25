resource "kafka_topic" "to_anonymize" {
  name               = "to.anonymize"
  replication_factor = 3
  partitions         = 15
}
resource "kafka_topic" "legacy_account_created_in_bill_events" {
  name               = "legacy.account.created.in.bill.events"
  replication_factor = 3
  partitions         = 15
}
