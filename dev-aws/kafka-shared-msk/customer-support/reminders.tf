resource "kafka_topic" "reminders_v1" {
  config = {
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for a day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms" = "-1"
  }
  name               = "customer-support.reminders_v1"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "reminders_notifications_v1" {
  config = {
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for a day
    "retention.ms" = "86400000"
  }
  name               = "customer-support.reminders_notifications_v1"
  partitions         = 5
  replication_factor = 3
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
