# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-events-v2" {
  name               = "account.events.v2"
  replication_factor = 3
  partitions         = 15
}


# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-atomic-v1" {
  name               = "account.atomic.v1"
  replication_factor = 3
  partitions         = 15
}
