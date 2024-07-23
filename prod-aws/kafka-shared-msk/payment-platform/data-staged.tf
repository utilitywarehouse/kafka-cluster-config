resource "kafka_topic" "payment_data_staged" {
  name               = "payment-platform.payment.data-staged"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

module "payment_bigquery_connector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.payment_data_staged.name,
  ]
  consume_groups   = ["payment-platform.payment-bigquery-connector"]
  cert_common_name = "payment-platform/payment-bigquery-connector"
}

module "payment_transaction_events_forwarder" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_data_staged.name,
  ]
  cert_common_name = "payment-platform/payment-transaction-events-forwarder"
}