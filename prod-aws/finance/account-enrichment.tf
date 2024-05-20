# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-enrichment-events" {
  name               = "account-enrichment.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1" #forever
    "cleanup.policy"  = "delete"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-enrichment-eqdb-loader-customer-events" {
  name               = "account-enrichment.eqdb-loader.customer.events"
  replication_factor = 3
  partitions         = 1
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1" #forever
    "cleanup.policy"  = "delete"
  }
}
