# https://docs.confluent.io/platform/7.8/connect/references/allconfigs.html#distributed-worker-configuration
resource "kafka_topic" "msk_backup_connect_configs" {
  name               = "dev-enablement.msk-backup.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "msk_backup_connect_offsets" {
  name               = "dev-enablement.msk-backup.connect-offsets"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "msk_backup_connect_status" {
  name               = "dev-enablement.msk-backup.connect-status"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}


# https://docs.confluent.io/platform/7.8/connect/security.html#worker-acl-requirements

# Allow Kafka Connect full access to internal topics
module "kafka_connect_msk_backup_full_internal_topics" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["dev-enablement.msk-backup.connect-configs", "dev-enablement.msk-backup.connect-offsets", "dev-enablement.msk-backup.connect-status", "dev-enablement.restore.customer-proposition.service-status.events.v3", "dev-enablement.restore.billing.DataStagedEventsFinance"]
  consume_groups   = ["dev-enablement.msk-backup.kafka-connect-group", "dev-enablement.msk-backup.kafka-connect-worker-group", "dev-enablement.kafka-connect-backup-all-parquet", "dev-enablement.kafka-connect-backup-parquet-select"]
  cert_common_name = "dev-enablement/kafka-connect-msk-backup"
}

resource "kafka_acl" "kafka_msk_backup_connect_describe_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/kafka-connect-msk-backup"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

/* temporary permission to backup all the topics in the cluster */
resource "kafka_acl" "kafka_msk_backup_connect_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=dev-enablement/kafka-connect-msk-backup"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_msk_backup_connect_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=dev-enablement/kafka-connect-msk-backup"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}
