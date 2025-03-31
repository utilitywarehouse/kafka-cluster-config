resource "kafka_topic" "events_end" {
  name               = "data-infra.uw.data-infra.product.v1.eventsend"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data forever
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
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
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
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
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
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
    # keep data for 3 days
    "retention.ms" = "259200001"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
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
    "data-infra.di-bigquery-connector-append",
    "data-infra.di-bigquery-connector-overwrite",
    "data-infra.di-bigquery-connector-6aa534794-e014-4953-b84f-1d41d93ff24562",
    "data-infra.di-bigquery-connector-801-802",
    "data-infra.di-bigquery-connector-988-e6177f2a",
    "data-infra.di-bigquery-connector-988-a52dd3fc",
    "data-infra.di-bigquery-connector-account-platform",
    "data-infra.di-bigquery-connector-netapp-audit"
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

module "di_dlq_manager" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.dlq.name,
    kafka_topic.dlq_alerts.name,
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
  ]
  cert_common_name = "data-infra/di-dlq-manager"
}

module "di_postgres_connector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.events.name,
    kafka_topic.dlq_requeue.name
  ]
  consume_groups = [
    "data-infra.di-postgres-connector"
  ]
  produce_topics = [
    kafka_topic.events_end.name,
    kafka_topic.dlq.name
  ]
  cert_common_name = "data-infra/di-postgres-connector"
}

module "di_cockroach_db_connector_help_and_support" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.events.name
  ]
  consume_groups = [
    "data-infra.di-cockroach-db-connector-help-and-support"
  ]
  produce_topics = [
    kafka_topic.events_end.name
  ]
  cert_common_name = "help-and-support/di-cockroach-db-connector"
}
