resource "kafka_topic" "iam_credentials_v1" {
  name               = "auth-customer.iam-credentials-v1"
  replication_factor = 3
  partitions         = 10
  config             = {
    # retain 100MB on each partition
    "retention.bytes"   = "104857600"
    # keep data for 7 days
    "retention.ms"      = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_credentials_api" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_credentials_v1.name]
  cert_common_name = "auth-customer/credentials-api"
}

module "iam_clubhouse_auth_provider" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_credentials_v1.name]
  cert_common_name = "clubhouse/auth-provider"
}

module "iam_credentials_indexer" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_credentials_v1.name) : "indexer-iam-credentials-v1" }
  cert_common_name = "auth-customer/iam-credentials-v1-indexer"
}

