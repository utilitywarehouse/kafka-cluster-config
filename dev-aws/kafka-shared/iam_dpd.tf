resource "kafka_topic" "iam_dpd_v1" {
  name               = "auth-customer.iam-dpd-v1"
  replication_factor = 3
  partitions         = 1
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

module "iam_dpd_mapper" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_dpd_v1.name]
  consume_topics   = { (kafka_topic.iam_credentials_v1.name) : "iam.dpd-mapper" }
  cert_common_name = "auth-customer/dpd-mapper"
}

module "iam_dpd_di_kafka_source_customer_login_succeeded" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_dpd_v1.name) : "iam.di-kafka-source-customer-login-succeeded" }
  cert_common_name = "auth-customer/di-kafka-source-customer-login-succeeded"
}

module "iam_dpd_di_kafka_source_customer_login_failed" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_dpd_v1.name) : "iam.di-kafka-source-customer-login-failed" }
  cert_common_name = "auth-customer/di-kafka-source-customer-login-failed"
}

module "iam_dpd_di_kafka_source_customer_password_reset_failed" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_dpd_v1.name) : "iam.di-kafka-source-customer-password-reset-failed" }
  cert_common_name = "auth-customer/di-kafka-source-customer-password-reset-failed"
}
