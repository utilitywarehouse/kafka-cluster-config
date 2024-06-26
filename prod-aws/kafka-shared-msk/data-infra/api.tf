resource "kafka_topic" "events" {
  name               = "data-infra.uw.data-infra.product.v1.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # infinite retention
    "retention.ms" = "-1"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.events.name
  ]
  cert_common_name = "data-infra/api"
}
