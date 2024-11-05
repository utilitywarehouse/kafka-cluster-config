resource "kafka_topic" "snowplow" {
  name               = "data-infra.uw.data-infra.pubsubbrige.snowplow"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 5 days
    "retention.ms" = "432000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "test_pla1275" {
  name               = "data-infra.uw.data-infra.test.pla1275"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
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
  consume_topics   = [(kafka_topic.snowplow.name)]
  consume_groups   = ["data-infra.di-snowplow-braze-conn"]
  cert_common_name = "data-infra/di-snowplow-braze-connector"
}

module "kafka_source_tls" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.test_pla1275.name)]
  consume_groups   = ["data-infra.di-kafka-source-tls"]
  cert_common_name = "data-infra/di-kafka-source-tls"
}
