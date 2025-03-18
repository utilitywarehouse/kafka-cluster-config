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
  consume_topics   = ["dev-enablement.connect-configs", "dev-enablement.connect-offsets", "dev-enablement.connect-status", "dev-enablement.msk-backup-source1", "dev-enablement.msk-backup-source2"]
  produce_topics   = ["dev-enablement.connect-configs", "dev-enablement.connect-offsets", "dev-enablement.connect-status", "dev-enablement.msk-backup-target1"]
  consume_groups   = ["dev-enablement.kafka-connect-group", "dev-enablement.kafka-connect-worker-group", "dev-enablement.kafka-connect-backup-all"]
  cert_common_name = "dev-enablement/kafka-connect"
}

resource "kafka_acl" "kafka_connect_describe_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/kafka-connect"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

/* temporary permission to backup all the topics in the cluster */
resource "kafka_acl" "kafka_connect_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/kafka-connect"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_connect_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=dev-enablement/kafka-connect"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}
