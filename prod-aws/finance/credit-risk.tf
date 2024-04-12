# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "credit-bureau-response-events" {
  name               = "credit-bureau-response.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "risk-assessed-events" {
  name               = "risk-assessed.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}


# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "credit-risk-model-input-events" {
  name               = "credit-risk-model-input.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
    "cleanup.policy"  = "delete"
  }
}
