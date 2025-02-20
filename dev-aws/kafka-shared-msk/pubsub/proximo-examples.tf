resource "kafka_topic" "proximo_example" {
  name               = "pubsub.proximo-example"
  replication_factor = 3
  partitions         = 3
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

module "example_proximo" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.proximo_example.name]
  consume_topics   = [(kafka_topic.proximo_example.name)]
  consume_groups   = ["pubsub.example-proximo"]
  cert_common_name = "pubsub/example-proximo"
}
