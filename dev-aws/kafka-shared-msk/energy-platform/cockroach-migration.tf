resource "kafka_topic" "cockroach_migration_events" {
  name               = "energy-platform.cockroach-migration.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 3 months
    "retention.ms" = "7889238000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# TODO: replace with the real producer(s) of energy-platform.cockroach-migration.events
# module "cockroach_migration_producer" {
#   source           = "../../../modules/tls-app"
#   produce_topics   = [kafka_topic.cockroach_migration_events.name]
#   cert_common_name = "energy-platform/cockroach-migration-producer"
# }

# TODO: replace with the real consumer(s) of energy-platform.cockroach-migration.events
# module "cockroach_migration_consumer" {
#   source           = "../../../modules/tls-app"
#   consume_topics   = [kafka_topic.cockroach_migration_events.name]
#   consume_groups   = ["energy-platform.cockroach-migration-consumer"]
#   cert_common_name = "energy-platform/cockroach-migration-consumer"
# }
