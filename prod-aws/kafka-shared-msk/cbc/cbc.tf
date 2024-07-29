resource "kafka_topic" "data_product_events_v1" {
  name = "cbc.DataProductEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "2629746000" # keep data for 1 month
    "local.retention.ms"    = "18000000"   # keep data locally for 5 hours
    "max.message.bytes"     = "2097152"    # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

module "cbc_data_infra_adapter_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = []
  consume_groups   = []
  produce_topics   = [kafka_topic.data_product_events_v1.name]
  cert_common_name = "cbc/cbc-data-infra-adapter-consumer"
}

module "cbc_data_infra_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.data_product_events_v1.name, ]
  consume_groups   = ["cbc.cbc-data-infra-exporter-v1"]
  cert_common_name = "cbc/cbc-data-infra-exporter"
}

module "cbc_fraud_detection_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.iam_credentials_v1_public.name,
  ]
  
  produce_topics   = []
  consume_groups   = ["cbc.cbc-fraud-detection-consumer-v1"]
  cert_common_name = "cbc/cbc-fraud-detection-consumer"
}
