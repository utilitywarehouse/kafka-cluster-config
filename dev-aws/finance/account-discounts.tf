# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-status-events" {
  name               = "account-status.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}
