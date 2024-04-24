# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "from-prod-account-events-anonymized-v0" {
  name               = "from-prod.account.events.anonymized.v0"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "dev-account-events-anonymized-v0" {
  name               = "dev.account.events.anonymized.v0"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-created-in-bill-events" {
  name               = "legacy.account.created.in.bill.events"
  replication_factor = 3
  partitions         = 15
}
