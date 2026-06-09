resource "kafka_topic" "test" {
  name               = "data-infra.test"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 30 days
    "retention.ms" = "259200000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "test_client" {
  source = "../../../modules/tls-app"
  consume_topics = [kafka_topic.test.name]
  produce_topics = [kafka_topic.test.name]
  consume_groups = ["test"]
  cert_common_name = "data-infra/test_client"
}
