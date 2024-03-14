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

resource "kafka_acl" "throughput_consumer_group_acl" {
  resource_name       = "dev-enablement.consume-throughput-batch"
  resource_type       = "Group"
  acl_principal       = "User:CN=dev-enablement/throughput-test-consumer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "throughput_consumer_topic_acl" {
  resource_name       = kafka_topic.pubsub_throughput_test.name
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/throughput-test-consumer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

