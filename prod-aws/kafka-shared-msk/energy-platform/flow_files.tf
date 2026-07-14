resource "kafka_topic" "flow_files_events" {
  name               = "energy-platform.flow-files.events"
  replication_factor = 3
  partitions         = 3
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2592000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "energy_flows_notification_outbox" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.flow_files_events.name]
  cert_common_name = "energy-platform/energy-flows-notification-outbox"
}
