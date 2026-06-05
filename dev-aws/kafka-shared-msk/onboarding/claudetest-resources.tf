# Example topic
resource "kafka_topic" "onboarding_topic_claudetest" {
  name               = "onboarding.claudetest"
  replication_factor = 3
  partitions         = 2
  config = {
    # keep on each partition 10MiB
    "retention.bytes" = "10485760"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# Example producer and consumer modules
module "onboarding_producer_claudetest" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["onboarding.claudetest"]
  cert_common_name = "onboarding/producer-claudetest"
}

module "onboarding_consumer_claudetest" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["onboarding.claudetest"]
  consume_groups   = ["onboarding.consumer-claudetest"]
  cert_common_name = "onboarding/consumer-claudetest"
}
