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

resource "kafka_topic" "events_send" {
  name               = "data-infra.uw.data-infra.product.v1.eventsend"
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

resource "kafka_topic" "test_pla1275" {
  name               = "data-infra.uw.data-infra.test.pla1275"
  replication_factor = 1
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # 5 days
    "retention.ms" = "86400000"
    # keep data in hot storage for 1 day
    #"local.retention.ms" = "86400000"
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
