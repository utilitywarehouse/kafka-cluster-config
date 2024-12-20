# https://docs.confluent.io/platform/7.8/connect/references/allconfigs.html#distributed-worker-configuration
resource "kafka_topic" "connect_configs" {
  name               = "dev-enablement.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "connect_offsets" {
  name               = "dev-enablement.connect-offsets"
  partitions         = 25
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "connect_status" {
  name               = "dev-enablement.connect-status"
  partitions         = 5
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}


# https://docs.confluent.io/platform/7.8/connect/security.html#worker-acl-requirements

# Allow Kafka Connect full access to internal topics
module "kafka_connect_full_internal_topics" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.connect-configs", "dev-enablement.connect-offsets", "dev-enablement.connect-status"]
  produce_topics   = ["dev-enablement.connect-configs", "dev-enablement.connect-offsets", "dev-enablement.connect-status"]
  consume_groups   = ["dev-enablement.kafka-connect-group"]
  cert_common_name = "dev-enablement/kafka-connect"
}