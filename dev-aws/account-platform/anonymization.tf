resource "kafka_topic" "from_prod_account_events_anonymized_v0" {
  name               = "from-prod.account.events.anonymized.v0"
  replication_factor = 3
  partitions         = 15
}

resource "kafka_topic" "dev_account_events_anonymized_v0" {
  name               = "dev.account.events.anonymized.v0"
  replication_factor = 3
  partitions         = 15
}

resource "kafka_topic" "legacy_account_created_in_bill_events" {
  name               = "legacy.account.created.in.bill.events"
  replication_factor = 3
  partitions         = 15
}
