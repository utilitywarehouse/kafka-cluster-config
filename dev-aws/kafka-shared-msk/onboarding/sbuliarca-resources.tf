#  SB test
resource "kafka_topic" "onboarding_topic_sbuliarca" {
  name               = "onboarding.sbuliarca"
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
module "onboarding_producer_sbuliarca" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["onboarding.sbuliarca"]
  cert_common_name = "onboarding/producer-sbuliarca"
}

module "onboarding_consumer_sbuliarca" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["onboarding.sbuliarca"]
  consume_groups   = ["onboarding.consumer-sbuliarca"]
  cert_common_name = "onboarding/consumer-sbuliarca"
}
