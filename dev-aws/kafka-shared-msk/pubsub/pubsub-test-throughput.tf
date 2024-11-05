resource "kafka_topic" "pubsub_throughput_test" {
  name               = "pubsub.throughput-test"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep on each partition 9.8GB
    "retention.bytes" = "10485760000"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MB
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

/*  no not use the module for the consumer, as we don't need quota */
resource "kafka_acl" "throughput_consumer_group_acl" {
  resource_name       = "pubsub.consume-throughput"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/throughput-test-consumer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "throughput_consumer_topic_acl" {
  resource_name       = kafka_topic.pubsub_throughput_test.name
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/throughput-test-consumer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

