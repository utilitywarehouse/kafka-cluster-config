resource "kafka_topic" "notes_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for a day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms" = "-1"
  }
  name               = "customer-support.notes_v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "ticketing_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for a day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms" = "-1"
  }
  name               = "customer-support.ticketing_v2"
  partitions         = 5
  replication_factor = 3
}

module "notes_benthos" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/notes-bq-v2"
  consume_topics   = [kafka_topic.notes_v2.name]
  consume_groups   = ["customer-support.notes-v2-benthos-bq-001"]
}

module "ticketing_benthos" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/ticketing-bq"
  consume_topics   = [kafka_topic.ticketing_v2.name]
  consume_groups   = ["customer-support.ticketing-benthos-bq-001"]
}

module "william_outbox" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/william-outbox"
  produce_topics = [
    kafka_topic.notes_v2.name,
    kafka_topic.ticketing_v2.name
  ]
}
