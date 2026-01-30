resource "kafka_topic" "es_demo_v1" {
  name = "partner-commission.es.demo.v1"

  replication_factor = 3
  partitions         = 15

  # infinite retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "es_demo_service_command" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.es_demo_v1.name]
  cert_common_name = "partner-commission/es-demo-service-command"
}

module "es_demo_service_query" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.es_demo_v1.name]
  consume_groups   = ["partner-commission.es-demo.events.v1"]
  cert_common_name = "partner-commission/es-demo-service-query"
}
