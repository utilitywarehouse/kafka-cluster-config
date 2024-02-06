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

moved {
  from = module.iam_credentials_producer_auth_provider.kafka_acl.producer_acl
  to   = module.iam_clubhouse_auth_provider.kafka_acl.producer_acl["auth-customer.iam-credentials-v1"]
}

moved {
  from = module.iam_credentials_producer_auth_provider.kafka_quota.producer_quota
  to   = module.iam_clubhouse_auth_provider.kafka_quota.quota
}

moved {
  from = module.iam_credentials_producer_api.kafka_acl.producer_acl
  to   = module.iam_credentials_api.kafka_acl.producer_acl["auth-customer.iam-credentials-v1"]
}

moved {
  from = module.iam_credentials_producer_api.kafka_quota.producer_quota
  to   = module.iam_credentials_api.kafka_quota.quota
}

moved {
  from = module.iam_credentials_consumer.kafka_acl.group_acl
  to   = module.iam_credentials_indexer.kafka_acl.group_acl["auth-customer.iam-credentials-v1"]
}

moved {
  from = module.iam_credentials_consumer.kafka_acl.topic_acl
  to   = module.iam_credentials_indexer.kafka_acl.topic_acl["auth-customer.iam-credentials-v1"]
}

moved {
  from = module.iam_credentials_consumer.kafka_quota.consumer_quota
  to   = module.iam_credentials_indexer.kafka_quota.quota
}
