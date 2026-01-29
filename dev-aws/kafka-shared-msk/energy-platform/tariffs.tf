resource "kafka_topic" "tariff_events" {
  name               = "energy-platform.tariff.events"
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

module "energy_tariff_system_api_outbox_worker" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.tariff_events.name]
  cert_common_name = "energy-platform/energy-tariff-system-api-outbox-worker"
}

module "energy_smart_tariffier" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.tariff_events.name]
  consume_groups   = ["energy-smart.smart-tariffier"]
  cert_common_name = "energy-smart/smart-tariffier"
}
