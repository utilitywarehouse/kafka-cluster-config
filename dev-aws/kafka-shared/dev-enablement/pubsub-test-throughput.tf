resource "kafka_topic" "pubsub_throughput_test" {
  name               = "dev-enablement.throughput-test"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 10GB on each partition
    "retention.bytes" = "10485760000"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "example_producer_throughput" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.pubsub_throughput_test.name]
  cert_common_name = "dev-enablement/example-producer"
}

module "example_process_individually_consumer_throughput" {
  source             = "../../../modules/tls-app"
  consume_topics     = [(kafka_topic.pubsub_throughput_test.name)]
  consume_groups     = ["dev-enablement.consume-throughput-indiv"]
  cert_common_name   = "dev-enablement/example-consume-process-individually"
  consumer_byte_rate = 10485760
}

module "example_process_batch_consumer_throughput" {
  source             = "../../../modules/tls-app"
  consume_topics     = [(kafka_topic.pubsub_throughput_test.name)]
  consume_groups     = ["dev-enablement.consume-throughput-batch"]
  cert_common_name   = "dev-enablement/example-consume-process-batch"
  consumer_byte_rate = 10485760
}

