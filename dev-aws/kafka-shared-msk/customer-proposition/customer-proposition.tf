resource "kafka_topic" "uswitch.data.v1" {
  name = "customer_proposition.uswitch.data.v1"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000"
    "max.message.bytes"     = "1048576"
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

module "uswitch-data-projector" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.uswitch.data.v1]
  cert_common_name = "customer-proposition/uswitch-data-projector"
}

module "di-uswitch-orders-kafka-source" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch.data.v1]
  cert_common_name = "customer-proposition/di-uswitch-orders-kafka-source"
}
