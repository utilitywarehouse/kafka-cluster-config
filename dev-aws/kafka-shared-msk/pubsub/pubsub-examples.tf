resource "kafka_topic" "pubsub_examples" {
  name               = "pubsub.examples"
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
  source           = "../../../modules/tls-app-v2"
  produce_topics   = [kafka_topic.pubsub_examples.name]
  cert_common_name = "pubsub/example-producer"
}

module "example_process_individually_consumer" {
  source           = "../../../modules/tls-app-v2"
  consume_topics   = [(kafka_topic.pubsub_examples.name)]
  consume_groups   = ["pubsub.example-consume-process-individually"]
  cert_common_name = "pubsub/example-consume-process-individually"
}

module "example_process_batch_consumer" {
  source           = "../../../modules/tls-app-v2"
  consume_topics   = [(kafka_topic.pubsub_examples.name)]
  consume_groups   = ["pubsub.example-consume-process-batch"]
  cert_common_name = "pubsub/example-consume-process-batch"
}

moved {
  from = module.example_process_individually_consumer.kafka_acl.group_acl["pubsub.examples"]
  to   = module.example_process_individually_consumer.kafka_acl.group_acl["pubsub.example-consume-process-individually"]
}

moved {
  from = module.example_process_batch_consumer.kafka_acl.group_acl["pubsub.examples"]
  to   = module.example_process_batch_consumer.kafka_acl.group_acl["pubsub.example-consume-process-batch"]
}

moved {
  from = module.es_topic_indexer.kafka_acl.group_acl["pubsub.pubsub-examples"]
  to   = module.es_topic_indexer.kafka_acl.group_acl["pubsub.es-topic-indexer"]
}
