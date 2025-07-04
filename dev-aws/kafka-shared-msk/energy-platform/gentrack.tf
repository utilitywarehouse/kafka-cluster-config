resource "kafka_topic" "gentrack_meter_read_events" {
  name               = "energy-platform.gentrack.meter.read.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "gentrack_billing_events" {
  name               = "energy-platform.gentrack.billing.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "gentrack_migration_events" {
  name               = "energy-platform.gentrack.migration.events"
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


resource "kafka_topic" "gentrack_market_interactions_events" {
  name               = "energy-platform.gentrack.market_interactions.events"
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

resource "kafka_topic" "gentrack_meterpoint_events" {
  name               = "energy-platform.gentrack.meterpoint.events"
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

module "gentrack_topic_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_meter_read_events.name,
    kafka_topic.gentrack_billing_events.name,
    kafka_topic.gentrack_migration_events.name,
    kafka_topic.gentrack_market_interactions_events.name,
    kafka_topic.gentrack_meterpoint_events.name
  ]
  consume_groups   = ["energy-platform.gentrack-topic-indexer"]
  cert_common_name = "energy-platform/gentrack-topic-indexer"
}

module "gentrack_adapter_webhook_processor" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.gentrack_meter_read_events.name,
    kafka_topic.gentrack_billing_events.name,
    kafka_topic.gentrack_migration_events.name,
    kafka_topic.gentrack_market_interactions_events.name,
    kafka_topic.gentrack_meterpoint_events.name
  ]
  cert_common_name = "energy-platform/gentrack-adapter-webhook-processor"
}

module "gentrack_migration" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_migration_events.name,
    kafka_topic.gentrack_market_interactions_events.name
  ]
  consume_groups   = ["energy-platform.gentrack-migration-consumer"]
  cert_common_name = "energy-platform/gentrack-migration-consumer"
}


module "billing_adapter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.gentrack_billing_events.name]
  consume_groups   = ["energy-billing.billing-adapter"]
  cert_common_name = "energy-billing/billing-adapter"
}

module "billing_sqs_processor" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.gentrack_billing_events.name]
  cert_common_name = "energy-billing/billing-sqs-processor"
}

module "gentrack_billing_test_producer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.gentrack_billing_events.name]
  cert_common_name = "energy-billing/gentrack-billing-test-producer"
}

