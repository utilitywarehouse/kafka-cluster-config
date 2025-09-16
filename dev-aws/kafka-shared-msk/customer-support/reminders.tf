resource "kafka_topic" "reminders_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep for 1 year
    "retention.ms" = "31557600000"
  }
  name               = "customer-support.reminders_v1"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "reminders_notifications_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms" = "64800000"
  }
  name               = "customer-support.reminders_notifications_v1"
  partitions         = 5
  replication_factor = 3
}

module "reminders_benthos" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/reminders-bq-v1"
  consume_topics   = [kafka_topic.reminders_v1.name]
  consume_groups   = ["customer-support.reminders-v1-benthos-bq-001"]
}

module "reminders_outbox" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/reminders-outbox-producer"
  produce_topics = [
    kafka_topic.reminders_v1.name,
    kafka_topic.reminders_notifications_v1.name
  ]
}

module "reminders_service" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/reminders-service"
  consume_topics   = [kafka_topic.reminders_notifications_v1.name]
}
