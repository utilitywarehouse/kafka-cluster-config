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

module "finserv_nats_to_msk_forwarder" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.finserv_check_status_events.name,
    kafka_topic.finserv_check_events.name,
    kafka_topic.finserv_account_changed_events.name,
  ]
  consume_groups   = ["cbc.finserv-nats-to-msk-forwarder-v1"]
  cert_common_name = "cbc/nats-to-msk-forwarder"
}
