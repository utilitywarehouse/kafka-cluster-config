# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "address-lookup-analytics-v1" {
  name               = "address.lookup.analytics.v1"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-braze-events-compacted" {
  name               = "legacy.account.braze.events.compacted"
  replication_factor = 3
  partitions         = 50
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
