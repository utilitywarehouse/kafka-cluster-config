# Topics
resource "kafka_topic" "basket_v1" {
  name               = "quoting-platform.basket.events.v1"
  replication_factor = 3
  partitions         = 15

  # finite retention - not intended to be replayed or projected into a source of truth
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # keep data for 3 days
    "retention.ms" = "259200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# ACLs
module "basket_service" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.basket_v1.name,
  ]
  cert_common_name = "quoting-platform/basket-service"
}

module "partner_planner" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_v1.name,
  ]
  consume_groups = [
    "partner-planner.basket-consumer-group-1",
    "partner-planner.basket-consumer-group-test-1"
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

module "mailer_basket" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_v1.name,
  ]
  consume_groups = [
    "quoting-platform.mailer-basket-consumer-group"
  ]
  cert_common_name = "quoting-platform/mailer"
}

module "acquisition_mailer_basket" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_v1.name,
  ]
  consume_groups = [
    "acquisition.mailer-basket-consumer-group"
  ]
  cert_common_name = "acquisition/mailer"
}
