resource "kafka_topic" "iam_credentials_v1" {
  name               = "auth-customer.iam-credentials-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_credentials_producer" {
  source = "../../modules/producer"

  topic = kafka_topic.iam_credentials_v1.name

  cert_common_name = "auth-customer/credentials-api"
}

module "iam_credentials_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.iam_credential_v1.name
  consumer_group = "indexer-iam-credentials-v1"

  cert_common_name = "auth-customer/iam-credentials-v1-indexer"
}

resource "kafka_acl" "indexer_iam_credentials_v1_topic_access" {
  resource_name       = "auth-customer.iam-credentials-v1"
  resource_type       = "Topic"
  acl_principal       = "User:CN=auth-customer/iam-credentials-v1-indexer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "indexer_iam_credentials_v1_group_access" {
  resource_name       = "indexer-iam-credentials-v1"
  resource_type       = "Group"
  acl_principal       = "User:CN=auth-customer/iam-credentials-v1-indexer"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "indexer_iam_credentials_v1_quota" {
  entity_name               = "User:CN=auth-customer/iam-credentials-v1-indexer"
  entity_type               = "user"
  config = {
    # limit consuming to 5 MB/s
    "consumer_byte_rate" = "5242880"
    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
