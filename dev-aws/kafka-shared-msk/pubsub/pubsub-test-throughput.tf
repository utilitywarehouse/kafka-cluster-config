resource "kafka_topic" "pubsub_throughput_test" {
  name               = "pubsub.throughput-test"
  replication_factor = 3
  partitions         = 15
  config = {
    # keep on each partition 9.8GiB
    "retention.bytes" = "10485760000"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# a topic to write to to simulate some real work
resource "kafka_topic" "pubsub_throughput_test_out" {
  name               = "pubsub.throughput-test-out"
  replication_factor = 3
  partitions         = 15
  config = {
    # we don't really care about the data on this topic, don't bother keeping
    # much around
    # keep data for 2 hours
    "retention.ms" = "7200000"
    # keep on each partition 2GiB
    "retention.bytes" = "2097152000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}


module "example_producer_throughput" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.pubsub_throughput_test.name]
  cert_common_name = "pubsub/example-throughput-producer"
}

module "throughput_test_consumer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.pubsub_throughput_test_out.name]
  consume_topics   = [kafka_topic.pubsub_throughput_test.name]
  consume_groups   = ["pubsub.throughput-test-consumer"]
  cert_common_name = "pubsub/throughput-test-consumer"
}
