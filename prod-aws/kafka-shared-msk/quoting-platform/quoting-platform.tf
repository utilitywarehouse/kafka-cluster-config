# Topics
resource "kafka_topic" "basket_v1" {
  name               = "quoting-platform.basket.events.v1"
  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "basket_requests_v1" {
  name               = "quoting-platform.basket-requests.events.v1"
  replication_factor = 3
  partitions         = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 72 hours - enough to cover an out-of-hours outage, not intended to be replayed
    "retention.ms" = "259200000"
  }
}

# ACLs
module "basket_service" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.basket_v1.name,
    kafka_topic.basket_requests_v1.name,
  ]
  cert_common_name = "quoting-platform/basket-service"
}

module "partner_planner" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_v1.name,
  ]
  consume_groups = [
    "partner-planner.basket-consumer-group-1"
  ]
  cert_common_name = "partner-planner/crdb-indexer"
}

module "partner_planner_basket_mapper" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_v1.name,
  ]
  consume_groups = [
    "partner-planner.basket-mapper-consumer-group"
  ]
  cert_common_name = "partner-planner/basket-mapper"
}

module "partner_planner_activity_reader" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_v1.name,
  ]
  consume_groups = [
    "partner-planner.activity-reader-consumer-group"
  ]
  cert_common_name = "partner-planner/activity-reader"
}

module "mailer_basket_requests" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_requests_v1.name,
  ]
  consume_groups = [
    "quoting-platform.mailer-basket-requests"
  ]
  cert_common_name = "quoting-platform/mailer"
}

module "acquisition_mailer_basket_requests" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_requests_v1.name,
  ]
  consume_groups = [
    "acquisition.mailer-basket-requests"
  ]
  cert_common_name = "acquisition/mailer"
}
