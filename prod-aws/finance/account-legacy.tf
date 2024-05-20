# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-events-fwd" {
  name               = "legacy.account.events.fwd"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1" #forever
    "cleanup.policy"  = "delete"
  }
}
