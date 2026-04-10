
resource "kafka_topic" "property_migration_events" {
  name               = "energy-platform.property.migration.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "property_events" {
  name               = "energy-platform.property.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}


module "gentrack_migration_worker" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.property_migration_events.name]
  cert_common_name = "energy-platform/gentrack-migration-worker"
}

module "energy_billing_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.property_migration_events.name,
    kafka_topic.gentrack_electronic_payment_events.name,
  ]
  consume_groups   = ["energy-billing.budget-plan-events-consumer"]
  cert_common_name = "energy-billing/budget-plan-events-consumer"
}

module "services_provisioning_processor_consumer" {
  source = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.property_events.name]
  consume_topics = [
    kafka_topic.gentrack_market_interactions_events.name,
  ]
  consume_groups   = ["energy-platform.services-provisioning-processor-consumer"]
  cert_common_name = "energy-platform/services-provisioning-processor-consumer"
}

