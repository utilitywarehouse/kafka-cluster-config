resource "kafka_topic" "uswitch_data_v1" {
  name = "customer-proposition.uswitch.data.v1"

  replication_factor = 3
  partitions         = 15

  # infinte retention
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

resource "kafka_topic" "uswitch_events_v2" {
  name = "customer-proposition.uswitch.events.v2"

  replication_factor = 3
  partitions         = 5

  # infinte retention
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

resource "kafka_topic" "service_status_v4" {
  name = "customer-proposition.service-status.events.v4"

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

resource "kafka_topic" "service_status_deadletter_v4" {
  name = "customer-proposition.service-status.events.deadletter.v4"

  replication_factor = 3
  partitions         = 1

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

module "uswitch_event_forwarder" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.uswitch_events_v2.name]
  consume_groups   = ["customer-proposition.uswitch-event-forwarder"]
  cert_common_name = "customer-proposition/uswitch-event-forwarder"
}

# tflint-ignore: terraform_naming_convention
module "uswitch-data-projector" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.uswitch_data_v1.name]
  consume_topics   = [kafka_topic.uswitch_events_v2.name]
  consume_groups   = ["customer-proposition.uswitch-data-projector"]
  cert_common_name = "customer-proposition/uswitch-data-projector"
}

# tflint-ignore: terraform_naming_convention
module "di-uswitch-orders-kafka-source" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_data_v1.name]
  consume_groups   = ["customer-proposition.di-uswitch-orders-kafka-source"]
  cert_common_name = "customer-proposition/di-uswitch-orders-kafka-source"
}

# tflint-ignore: terraform_naming_convention
module "uswitch-proxy" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.uswitch_events_v2.name]
  cert_common_name = "customer-proposition/uswitch-proxy"
}

# tflint-ignore: terraform_naming_convention
module "uswitch-order-submitter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_events_v2.name]
  consume_groups   = ["customer-proposition.order-submitter"]
  cert_common_name = "customer-proposition/uswitch-order-submitter"
}

# tflint-ignore: terraform_naming_convention
module "uswitch-reporter-switches-consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_events_v2.name]
  consume_groups   = ["customer-proposition.uswitch-reporter-switches-consumer"]
  cert_common_name = "customer-proposition/uswitch-reporter-switches-consumer"
}

# tflint-ignore: terraform_naming_convention
module "uswitch-mailer-switch-projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.uswitch_events_v2.name]
  consume_groups   = ["customer-proposition.switch-mailer-switch-projector"]
  cert_common_name = "customer-proposition/uswitch-mailer-switch-projector"
}

# tflint-ignore: terraform_naming_convention
module "uswitch-reporter" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.uswitch_events_v2.name]
  cert_common_name = "customer-proposition/uswitch-reporter"
}

# tflint-ignore: terraform_naming_convention
module "es-indexer-uswitch-data-v1" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-uswitch.data.v1"]
  consume_topics   = [kafka_topic.uswitch_data_v1.name]
  cert_common_name = "customer-proposition/es-indexer-uswitch-data-v1"
}

module "es_indexer_uswitch_events_v2" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-uswitch.events.v2"]
  consume_topics   = [kafka_topic.uswitch_events_v2.name]
  cert_common_name = "customer-proposition/es-indexer-uswitch-events-v2"
}

module "bundle_service" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.bundle-service-service-status.events.v4"]
  consume_topics   = [kafka_topic.service_status_v4.name]
  cert_common_name = "customer-proposition/bundle-service"
}

module "cbc_loader_service" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.service_status_v4.name, kafka_topic.service_status_deadletter_v4.name]
  cert_common_name = "customer-proposition/cbc-loader-service"
}

module "insurance_loader_service" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.service_status_v4.name, kafka_topic.service_status_deadletter_v4.name]
  cert_common_name = "customer-proposition/insurance_loader_service"
}

module "telecom_fixed_line_loader_service" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.service_status_v4.name]
  cert_common_name = "customer-proposition/telecom-fixed-line-loader-service"
}

module "es_indexer_service_status_v4" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-service-status.events.v4"]
  consume_topics   = [kafka_topic.service_status_v4.name]
  cert_common_name = "customer-proposition/es-indexer-service-status-events-v4"
}

module "es_indexer_service_status_dl_v4" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["customer-proposition.es-indexer-service-status.events.deadletter.v4"]
  consume_topics   = [kafka_topic.service_status_deadletter_v4.name]
  cert_common_name = "customer-proposition/es-indexer-service-status-events-dl-v4"
}
