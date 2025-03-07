resource "kafka_topic" "iam_click_v2" {
  name               = "auth.iam-click-v2"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_click_v2_service" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_click_v2.name]
  cert_common_name = "auth/iam-click-v2-service"
}

module "iam_click_v2_di" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_click_v2.name)]
  consume_groups   = ["iam.click-v2-di"]
  cert_common_name = "auth/iam-click-v2-di"
}

module "iam_click_v2_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_click_v2.name)]
  consume_groups   = ["auth.click-v2-events-indexer"]
  cert_common_name = "auth/click-v2-events-indexer"
}