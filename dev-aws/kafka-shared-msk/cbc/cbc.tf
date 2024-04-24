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

resource "kafka_topic" "rating_events_v3" {
  name = "cbc.RatingEvents_v3"

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
  produce_topics   = [kafka_topic.FraudEvents.name]
  consume_groups   = ["cbc.cbc-fraud-detection-consumer-v1"]
  cert_common_name = "cbc/cbc-fraud-detection-consumer"
}

module "cbc_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.FraudEvents.name, kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-events-indexer"]
  cert_common_name = "cbc/cbc-events-indexer"
}

module "cbc_bigquery_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.FraudEvents.name, kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-bigquery-exporter-v1"]
  cert_common_name = "cbc/cbc-bigquery-exporter"
}

module "cbc_insights_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-insights-projector"]
  cert_common_name = "cbc/cbc-insights-projector"
}

module "cbc_transaction_notification_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-transaction-notification-projector-v3"]
  cert_common_name = "cbc/cbc-transaction-notification-projector"
}

module "cbc_transaction_rater_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-transaction-rater-projector-v1"]
  cert_common_name = "cbc/cbc-transaction-rater-projector"
}

module "cbc_sodexo_transaction_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-sodexo-transaction-exporter-v1"]
  cert_common_name = "cbc/cbc-sodexo-transaction-exporter"
}

module "cbc_retailer_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-retailer-projector-v1"]
  cert_common_name = "cbc/cbc-retailer-projector"
}

module "cbc_transaction_notification_mapper" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-transaction-notification-mapper-v2"]
  cert_common_name = "cbc/cbc-transaction-notification-mapper"
}

module "cbc_network_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.RatingEvents_v3.name]
  consume_groups   = ["cbc.cbc-network-projector-v4"]
  cert_common_name = "cbc/cbc-network-projector"
}

module "cbc_retailer_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.RatingEvents_v3.name]
  cert_common_name = "cbc/cbc-retailer-api"
}