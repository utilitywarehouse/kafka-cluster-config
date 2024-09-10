resource "kafka_topic" "data_staged_events_finance" {
  name               = "billing.DataStagedEventsFinance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # 26.8 GB
    "retention.bytes" = "26843545600"
    # 105 MB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    "retention.ms"       = "604800000" #7 days
    "cleanup.policy"     = "delete"
  }
}

resource "kafka_topic" "historical_data_staged_events_finance" {
  name               = "billing.historical-data-staged-events-finance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # 805 GB
    "retention.bytes" = "805306368000"
    # 105 MB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 7 days
    "retention.ms"   = "604800000"
    "cleanup.policy" = "delete"
  }
}

module "finance_bigquery_connector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.data_staged_events_finance.name,
  ]
  produce_topics = [
    kafka_topic.historical_data_staged_events_finance.name,
  ]
  consume_groups   = ["billing.finance-bigquery-connector"]
  cert_common_name = "billing/finance-bigquery-connector"
}

module "finance_tx_log_staging_connector" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.data_staged_events_finance.name,
  ]
  #  limit to 150 KB per broker, as the consumer doesn't keep up with the producer and the producer is loading the brokers CPU when not throttled.
  producer_byte_rate = "153600"
  cert_common_name   = "billing/finance-tx-log-staging-connector"
}

module "historical_bigquery_connector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.historical_data_staged_events_finance.name,
  ]
  consume_groups   = ["billing.historical-bigquery-connector"]
  cert_common_name = "billing/historical-bigquery-connector"
}
