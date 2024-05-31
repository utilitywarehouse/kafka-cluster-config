resource "kafka_topic" "pubsub_examples" {
  name               = "pubsub.examples"
  replication_factor = 3
  partitions         = 3
  config = {
    # retain 10MB on each partition
    "retention.bytes" = "10485760"
    # keep data for 6 hours
    "retention.ms" = "21600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "example_producer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.pubsub_examples.name]
  cert_common_name = "pubsub/example-producer"
}

module "example_process_individually_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.pubsub_examples.name)]
  consume_groups   = ["pubsub.example-consume-process-individually"]
  cert_common_name = "pubsub/example-consume-process-individually"
}

module "example_process_batch_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.pubsub_examples.name)]
  consume_groups   = ["pubsub.example-consume-process-batch"]
  cert_common_name = "pubsub/example-consume-process-batch"
}

module "es_topic_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.pubsub_examples.name)]
  consume_groups   = ["dev-enablement.es-topic-indexer"]
  cert_common_name = "dev-enablement/es-topic-indexer"
}
