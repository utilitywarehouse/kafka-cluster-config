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
resource "kafka_acl" "kafka_connect_full_internal_topics" {
  resource_name       = "_connect-*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/kafka-connect"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

# Allow Kafka Connect to consume only on other topics
resource "kafka_acl" "kafka_connect_consume_other_topics" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/kafka-connect"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

# Needs read/write to register itself as a consumer group
resource "kafka_acl" "kafka_connect_group_acl" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=dev-enablement/kafka-connect"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}
