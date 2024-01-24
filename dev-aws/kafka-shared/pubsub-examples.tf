resource "kafka_topic" "pubsub_examples" {
  name               = "dev-enablement.pubsub-examples"
  replication_factor = 3
  partitions         = 10
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

module "example_producer" {
  source = "../../modules/producer"

  topic            = kafka_topic.pubsub_examples.name
  cert_common_name = "dev-enablement/example-producer"
}

module "example_process_individually_consumer" {
  source = "../../modules/consumer"

  topic            = kafka_topic.pubsub_examples.name
  consumer_group   = "example-consume-process-individually"
  cert_common_name = "dev-enablement/example-consume-process-individually"
}

module "example_process_batch_consumer" {
  source = "../../modules/consumer"

  topic            = kafka_topic.pubsub_examples.name
  consumer_group   = "example-consume-process-batch"
  cert_common_name = "dev-enablement/example-consume-process-batch"
}
