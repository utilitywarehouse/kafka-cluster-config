resource "kafka_topic" "pubsub_examples" {
  name               = "pubsub.examples"
  replication_factor = 3
  partitions         = 3
  config = {
    # keep on each partition 10MiB
    "retention.bytes" = "10485760"
    # keep data for 6 hours
    "retention.ms" = "21600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "pubsub_examples2" {
  name               = "pubsub.examples2"
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

module "example_process_concurrently_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.pubsub_examples.name)]
  consume_groups   = ["pubsub.example-consume-process-concurrently"]
  cert_common_name = "pubsub/example-consume-process-concurrently"
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

module "kafka_connect_pubsub_examples" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.pubsub_examples.name]
  consume_groups   = ["dev-enablement.kafka-connect-consumer-group"]
  cert_common_name = "dev-enablement/kafka-connect"
}
