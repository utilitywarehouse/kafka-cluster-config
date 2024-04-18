resource "kafka_topic" "proximo_example" {
  name               = "dev-enablement.proximo-example"
  replication_factor = 3
  partitions         = 3
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "example_proximo_produce" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.proximo_example.name]
  cert_common_name = "dev-enablement/example-proximo"
}

module "example_proximo_consume" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.proximo_example.name)]
  consume_groups   = ["dev-enablement.example-proximo"]
  cert_common_name = "dev-enablement/example-proximo"
}
