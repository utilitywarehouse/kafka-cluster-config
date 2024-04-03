resource "kafka_topic" "uswitch_data_v1" {
  name = "customer-proposition.uswitch.data.v1"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    # keep data locally for 1 hour
    "local.retention.ms" = "3600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "uswitch_events_v1" {
  name = "customer-proposition.uswitch.events.v1"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    # keep data locally for 1 hour
    "local.retention.ms" = "3600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "uswitch-data-projector" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.uswitch_data_v1.name]
  consume_topics   = [kafka_topic.uswitch_events_v1.name]
  consume_groups   = ["customer-proposition.uswitch-data-projector"]
  cert_common_name = "customer-proposition/uswitch-data-projector"
}

module "di-uswitch-orders-kafka-source" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_data_v1.name]
  consume_groups   = ["customer-proposition.di-uswitch-orders-kafka-source"]
  cert_common_name = "customer-proposition/di-uswitch-orders-kafka-source"
}

module "uswitch-proxy" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.uswitch_events_v1.name]
  cert_common_name = "customer-proposition/uswitch-proxy"
}

module "uswitch-order-submitter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_events_v1.name]
  consume_groups   = ["customer-proposition.order-submitter"]
  cert_common_name = "customer-proposition/uswitch-order-submitter"
}

module "uswitch-reporter-switches-consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_events_v1.name]
  consume_groups   = ["customer-proposition.uswitch-reporter-2"]
  cert_common_name = "customer-proposition/uswitch-reporter-switches-consumer"
}

module "uswitch-mailer-switch-projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_events_v1.name]
  consume_groups   = ["customer-proposition.uswitch-mailer"]
  cert_common_name = "customer-proposition/uswitch-mailer-switch-projector"
}
