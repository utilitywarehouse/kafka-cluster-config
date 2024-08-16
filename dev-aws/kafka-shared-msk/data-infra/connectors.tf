resource "kafka_topic" "events_end" {
  name               = "data-infra.uw.data-infra.product.v1.eventsend"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # infinite retention
    "retention.ms" = "-1"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "dlq_requeue" {
  name               = "data-infra.product.v1.events.requeue"
  replication_factor = 3
  partitions         = 1
  config = {

    "remote.storage.enable" = "true"
    # 1 month
    "retention.ms" = "2629800000"
    # 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "dlq" {
  name               = "data-infra.product.v1.events.dlq"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # 1 month
    "retention.ms" = "2629800000"
    # 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "dlq_alerts" {
  name               = "data-infra.product.v1.events.dlq.alerts"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    #3 days
    "retention.ms" = "259200001"
    # 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "di_bigquery_connector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.events.name,
    kafka_topic.dlq_requeue.name
  ]
  consume_groups = [
    "data-infra.di-bq-connector",
    "data-infra.di-bigquery-connector-overwrite"
  ]
  produce_topics = [
    kafka_topic.events_end.name,
    kafka_topic.dlq.name
  ]
  cert_common_name = "data-infra/di-bigquery-connector"
}

module "di_braze_connector" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.events.name]
  consume_groups = [
    "data-infra.di-braze-connector"
  ]
  produce_topics = [
    kafka_topic.events_end.name
  ]
  cert_common_name = "data-infra/di-braze-connector"
}

module "di_cockroach_db_connector_data_infra" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.events.name
  ]
  consume_groups = [
    "data-infra.di-cockroach-db-connector"
  ]
  produce_topics = [
    kafka_topic.events_end.name
  ]
  cert_common_name = "data-infra/di-cockroach-db-connector"
}

module "di_cockroach_db_connector_contact_channels" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.events.name
  ]
  consume_groups = [
    "data-infra.di-cockroach-db-connector-contact-channels"
  ]
  produce_topics = [
    kafka_topic.events_end.name
  ]
  cert_common_name = "contact-channels/di-cockroach-db-connector"
}

module "di_ftp_connector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.events.name,
    kafka_topic.dlq_requeue.name
  ]
  consume_groups = [
    "data-infra.di-file-transfer-connector"
  ]
  produce_topics = [
    kafka_topic.events_end.name,
    kafka_topic.dlq.name
  ]
  cert_common_name = "data-infra/di-ftp-connector"
}

resource "kafka_topic" "dlq_requeue_v2" {
  name               = "data-infra.product.v1.events.requeue-v2"
  replication_factor = 3
  partitions         = 1
  config = {

    "remote.storage.enable" = "true"
    # 1 month
    "retention.ms" = "2629800000"
    # 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "dlq_v2" {
  name               = "data-infra.product.v1.events.dlq-v2"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # 1 month
    "retention.ms" = "2629800000"
    # 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "di_dlq_manager" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.dlq.name,
    kafka_topic.dlq_alerts.name,
    kafka_topic.dlq_v2.name,
  ]
  consume_groups = [
    "data-infra.dlq",
    "data-infra.dlqv2",
    "data-infra.dlq.alerts",
  ]
  produce_topics = [
    kafka_topic.dlq.name,
    kafka_topic.dlq_requeue.name,
    kafka_topic.dlq_alerts.name,
    kafka_topic.dlq_v2.name,
    kafka_topic.dlq_requeue_v2.name,
  ]
  cert_common_name = "data-infra/di-dlq-manager"
}
