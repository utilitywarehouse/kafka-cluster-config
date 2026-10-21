# Topic
resource "kafka_topic" "basket_abandoned_v1" {
  name               = "acquisition.basket.abandoned.v1"
  replication_factor = 3
  partitions         = 3

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
module "abandoned_basket_survey" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.basket_abandoned_v1.name,
  ]
  cert_common_name = "acquisition/abandoned-basket-survey"
}

module "mailer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.basket_abandoned_v1.name,
  ]
  consume_groups = [
    "quoting-platform.mailer-consumer-group"
  ]
  cert_common_name = "quoting-platform/mailer"
}
