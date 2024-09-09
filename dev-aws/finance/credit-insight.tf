resource "kafka_topic" "credit_insights_validation_errors" {
  name               = "credit-insights-validation.errors"
  partitions         = 10
  replication_factor = 3

  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000" # 7 days since these events will be indexed
    "cleanup.policy"  = "delete"
  }
}
