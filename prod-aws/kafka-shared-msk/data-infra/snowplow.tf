resource "kafka_topic" "snowplow" {
  name               = "data-infra.uw.data-infra.pubsubbrige.snowplow"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # 5 days
    "retention.ms" = "432000000"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "pubsub_bridge" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.snowplow.name]
  cert_common_name = "data-infra/pubsub-bridge"
}

module "snowplow_braze_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.snowplow.name]
  consume_groups   = ["data-infra.di-snowplow-braze-conn"]
  cert_common_name = "data-infra/di-snowplow-braze-connector"
}
