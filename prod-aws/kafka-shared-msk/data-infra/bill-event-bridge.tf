resource "kafka_topic" "bill_event_bridge_dlq" {
  name               = "data-infra.bill_event_bridge.dlq"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}


module "di_bill_event_bridge" {
  source = "../../../modules/tls-app"

  produce_topics = [kafka_topic.bill_event_bridge_dlq.name]

  cert_common_name = "bill-integration/bill-event-bridge"
}
