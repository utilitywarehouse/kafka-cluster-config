# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "complaints-diffs-events" {
  name               = "complaints-diffs.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" #30 days
    "cleanup.policy"  = "delete"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "complaints-eqdb-loader-customer-events" {
  name               = "complaints.eqdb-loader.customer.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" #30 days
    "cleanup.policy"  = "delete"
  }
}
