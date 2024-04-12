# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-status-events" {
  name               = "account-status.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes"   = "-1"
    "retention.ms"      = "604800000"
    "cleanup.policy"    = "delete"
    "max.message.bytes" = "104857600"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-eligibility-changed-events" {
  name               = "account-eligibility-changed.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "max.message.bytes" = "104857600"
    "retention.ms"      = "604800000"
  }
}
