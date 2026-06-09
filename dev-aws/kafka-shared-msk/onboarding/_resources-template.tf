# Example topic
resource "kafka_topic" "onboarding_topic_your_name" {
  count = 0 # Not creating this resource. Remove the count when copying.

  name               = "onboarding.your-name"
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
module "onboarding_producer_your_name" {
  count = 0 # Not creating this resource. Remove the count when copying.

  source           = "../../../modules/tls-app"
  produce_topics   = ["onboarding.your-name"]
  cert_common_name = "onboarding/producer-your-name"
}

module "onboarding_consumer_your_name" {
  count = 0 # Not creating this resource. Remove the count when copying.

  source           = "../../../modules/tls-app"
  consume_topics   = ["onboarding.your-name"]
  consume_groups   = ["onboarding.consumer-your-name"]
  cert_common_name = "onboarding/consumer-your-name"
}
