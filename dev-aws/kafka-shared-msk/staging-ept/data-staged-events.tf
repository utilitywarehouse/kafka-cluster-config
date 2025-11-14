resource "kafka_topic" "data_staged_events_finance" {
  name               = "staging-ept.DataStagedEventsFinance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # keep on each partition 750GiB
    "retention.bytes" = "805306368000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    "retention.ms"       = "604800000" # keep data for 7 days
    "cleanup.policy"     = "delete"
  }
}

resource "kafka_topic" "historical_data_staged_events_finance" {
  name               = "staging-ept.historical-data-staged-events-finance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # keep on each partition 750GiB
    "retention.bytes" = "805306368000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
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
  cert_common_name = "billing/finance-tx-log-staging-connector"
}

module "historical_bigquery_connector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.historical_data_staged_events_finance.name,
  ]
  consume_groups   = ["billing.historical-bigquery-connector"]
  cert_common_name = "billing/historical-bigquery-connector"
}
