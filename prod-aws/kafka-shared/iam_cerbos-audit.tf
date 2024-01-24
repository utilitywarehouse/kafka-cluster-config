resource "kafka_topic" "iam_cerbos_audit_v1" {
  name               = "auth.iam-cerbos-audit-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
  }
}

module "iam_cerbos_audit_producer" {
  source = "../../modules/producer"

  topic = kafka_topic.iam_cerbos_audit_v1.name

  cert_common_name = "auth/iam-policy-decision-api"
}

module "iam_cerbos_audit_indexer_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.iam_identitydb_v1.name
  consumer_group = "iam-cerbos-audit-indexer"

  cert_common_name = "auth/iam-cerbos-audit-v1-indexer"
}

module "iam_cerbos_audit_exporter_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.iam_identitydb_v1.name
  consumer_group = "iam-cerbos-audit-exporter"

  cert_common_name = "auth/iam-cerbos-audit-v1-exporter"
}

###
## ---- OLD ----
## Remove the below once clients have migrated to the above
###

resource "kafka_acl" "iam_cerbos_audit_v1_access" {
  resource_name       = "auth.iam-cerbos-audit-v1"
  resource_type       = "Topic"
  acl_principal       = "User:CN=auth/policy-decision-point"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "iam_cerbos_audit_v1_quota" {
  entity_name               = "User:CN=auth/policy-decision-point"
  entity_type               = "user"
  config = {
    # limit producing to 5 MB/s
    "producer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}

resource "kafka_acl" "indexer_iam_cerbos_audit_v1_topic_access" {
  resource_name       = "auth.iam-cerbos-audit-v1"
  resource_type       = "Topic"
  acl_principal       = "User:CN=auth/iam-cerbos-audit-v1-indexer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "indexer_iam_cerbos_audit_v1_group_access" {
  resource_name       = "indexer-iam-cerbos-audit-v1"
  resource_type       = "Group"
  acl_principal       = "User:CN=auth/iam-cerbos-audit-v1-indexer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "indexer_iam_cerbos_audit_v1_quota" {
  entity_name               = "User:CN=auth/iam-cerbos-audit-v1-indexer"
  entity_type               = "user"
  config = {
    # limit consuming to 5 MB/s
    "consumer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}

resource "kafka_acl" "exporter_iam_cerbos_audit_v1_topic_access" {
  resource_name       = "auth.iam-cerbos-audit-v1"
  resource_type       = "Topic"
  acl_principal       = "User:CN=auth/iam-cerbos-audit-v1-exporter"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "exporter_iam_cerbos_audit_v1_group_access" {
  resource_name       = "exporter-iam-cerbos-audit-v1"
  resource_type       = "Group"
  acl_principal       = "User:CN=auth/iam-cerbos-audit-v1-exporter"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "exporter_iam_cerbos_audit_v1_quota" {
  entity_name               = "User:CN=auth/iam-cerbos-audit-v1-exporter"
  entity_type               = "user"
  config = {
    # limit consuming to 5 MB/s
    "consumer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
