resource "kafka_topic" "finserv_account_changed_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "account-identity.account.change.events" # account-change-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "finserv_check_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "account-identity.check.events" # check-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "finserv_check_status_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
  }
  name               = "account-identity.check.status.events" # account-status-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "public_pep_sanction_events_v2" {
  name = "account-identity.public.pep-sanction.events.v2"
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 12 hours
    "retention.ms" = "43200000"
  }
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "private_pep_sanction_events_v2" {
  name = "account-identity.private.pep-sanction.events.v2"
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
  }
  partitions         = 15
  replication_factor = 3
}

module "finserv_pep_sanction_listener_v2" {
  source         = "../../../modules/tls-app"
  consume_topics = []
  produce_topics = [
    kafka_topic.private_pep_sanction_events_v2.name,
  ]
  cert_common_name = "finserv/pep-sanction-listener-v2"
}

module "finserv_pep_sanction_processor_v2" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.private_pep_sanction_events_v2.name,
  ]
  produce_topics = [
    kafka_topic.public_pep_sanction_events_v2.name,
  ]
  consume_groups   = ["finserv.finserv-pep-sanction-processor-v2"]
  cert_common_name = "finserv/pep-sanction-processor-v2"
}

module "finserv_nats_to_msk_forwarder" {
  source         = "../../../modules/tls-app"
  consume_topics = []
  produce_topics = [
    kafka_topic.finserv_check_status_events.name,
    kafka_topic.finserv_check_events.name,
    kafka_topic.finserv_account_changed_events.name,
  ]
  consume_groups   = ["cbc.finserv-nats-to-msk-forwarder-v1"]
  cert_common_name = "cbc/nats-to-msk-forwarder"
}

module "cbc_bigquery_exporter" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.finserv_check_status_events.name
  ]
  consume_groups   = ["cbc.cbc-bigquery-exporter-v1"]
  cert_common_name = "cbc/cbc-bigquery-exporter"
}

module "cbc_pep_checker" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.finserv_check_status_events.name
  ]
  consume_groups   = ["cbc.cbc-pep-checker-v8"]
  cert_common_name = "cbc/cbc-pep-checker"
}

module "finserv_account_service_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.account_identity_legacy_account_events.name
  ]
  produce_topics = [
    kafka_topic.finserv_account_changed_events.name
  ]
  consume_groups   = ["finserv.account-service-consumer"]
  cert_common_name = "finserv/account-service-consumer"
}

module "finserv_account_service" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.finserv_account_changed_events.name
  ]
  cert_common_name = "finserv/account-service"
}

module "finserv_account_service_screening_worker" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.finserv_account_changed_events.name
  ]
  produce_topics = [
    kafka_topic.finserv_check_events.name,
    kafka_topic.finserv_check_status_events.name
  ]
  consume_groups   = ["finserv.finserv-pep-sanctions-screening-worker-ace"]
  cert_common_name = "finserv/pep-sanctions-screening-worker"
}

module "finserv_pep_sanctions_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.finserv_check_events.name,
    kafka_topic.finserv_check_status_events.name
  ]
  cert_common_name = "finserv/pep-sanctions-api"
}

module "finserv_pep_sanctions_listener" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.finserv_check_status_events.name
  ]
  cert_common_name = "finserv/pep-sanctions-listener"
}
