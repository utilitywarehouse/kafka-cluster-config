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
