# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "FraudEvents" {
  name = "cbc.FraudEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

module "cbc_fraud_detection_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.FraudEvents.name]
  cert_common_name = "cbc/cbc-fraud-detection-api"
}
module "cbc_fraud_detection_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.FraudEvents.name, "auth-customer.iam-credentials-v1-public"]
  consume_groups   = ["cbc.cbc-fraud-detection-consumer-v1"]
  cert_common_name = "cbc/cbc-fraud-detection-consumer"
}

module "cbc_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.FraudEvents.name]
  consume_groups   = ["cbc.cbc-events-indexer"]
  cert_common_name = "cbc/cbc-events-indexer"
}

module "cbc_bigquery_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.FraudEvents.name]
  consume_groups   = ["cbc.cbc-bigquery-exporter-v1"]
  cert_common_name = "cbc/cbc-bigquery-exporter"
}
