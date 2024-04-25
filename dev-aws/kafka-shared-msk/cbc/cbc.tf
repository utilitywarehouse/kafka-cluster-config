# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "FraudEvents" {
  name = "cbc.FraudEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "rating_events_v3" {
  name = "cbc.RatingEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "challenge_events_v1" {
  name = "cbc.ChallengeEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "charges_events_v1" {
  name = "cbc.ChargesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "lifecycle_events_v2" {
  name = "cbc.LifecycleEvents_v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "topup_events_v1" {
  name = "cbc.TopUpEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "transaction_events_v3" {
  name = "cbc.TransactionEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

module "cbc_fraud_detection_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.FraudEvents.name]
  cert_common_name = "cbc/cbc-fraud-detection-api"
}

module "cbc_fraud_detection_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["auth-customer.iam-credentials-v1-public", kafka_topic.FraudEvents.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.topup_events_v1, kafka_topic.transaction_events_v3.name]
  produce_topics   = [kafka_topic.FraudEvents.name]
  consume_groups   = ["cbc.cbc-fraud-detection-consumer-v1"]
  cert_common_name = "cbc/cbc-fraud-detection-consumer"
}

module "cbc_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.FraudEvents.name, kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.charges_events_v1.name, kafka_topic.challenge_events_v1.name, kafka_topic.topup_events_v1.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-events-indexer"]
  cert_common_name = "cbc/cbc-events-indexer"
}

module "cbc_bigquery_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.FraudEvents.name, kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.charges_events_v1.name, kafka_topic.challenge_events_v1.name, kafka_topic.topup_events_v1.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-bigquery-exporter-v1"]
  cert_common_name = "cbc/cbc-bigquery-exporter"
}

module "cbc_insights_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-insights-projector"]
  cert_common_name = "cbc/cbc-insights-projector"
}

module "cbc_transaction_notification_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-transaction-notification-projector-v3"]
  cert_common_name = "cbc/cbc-transaction-notification-projector"
}

module "cbc_transaction_notification_mapper" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-transaction-notification-mapper-v2"]
  produce_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-transaction-notification-mapper"
}

module "cbc_transaction_rater_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-transaction-rater-api"
}

module "cbc_transaction_rater_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-transaction-rater-v1"]
  cert_common_name = "cbc/cbc-transaction-rater-consumer"
}

module "cbc_transaction_rater_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-transaction-rater-projector-v1"]
  cert_common_name = "cbc/cbc-transaction-rater-projector"
}

module "cbc_sodexo_transaction_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-sodexo-transaction-exporter-v1"]
  cert_common_name = "cbc/cbc-sodexo-transaction-exporter"
}

module "cbc_retailer_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.rating_events_v3.name, kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-retailer-projector-v1"]
  cert_common_name = "cbc/cbc-retailer-projector"
}

module "cbc_network_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.rating_events_v3.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-network-projector-v4"]
  cert_common_name = "cbc/cbc-network-projector"
}

module "cbc_network_awin_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-network-awin-processor-v1"]
  cert_common_name = "cbc/cbc-network-awin-processor"
}

module "cbc_network_partnerize_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-network-partnerize-processor-v1"]
  cert_common_name = "cbc/cbc-network-partnerize-processor"
}

module "cbc_retailer_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.rating_events_v3.name]
  cert_common_name = "cbc/cbc-retailer-api"
}

module "cbc_push_notifications_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.challenge_events_v1.name, kafka_topic.transaction_events_v3.name]
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-push-notifications-v1"]
  cert_common_name = "cbc/cbc-push-notifications-consumer"
}

module "cbc_push_notifications_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-push-notifications-projector-v0.1"]
  cert_common_name = "cbc/cbc-push-notifications-projector"
}

module "cbc_biller_cronjob" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-biller-consumer"
}

module "cbc_biller_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.charges_events_v1.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-biller-v3"]
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-biller-consumer"
}

module "cbc_biller_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.charges_events_v1.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-biller-projector-v3"]
  cert_common_name = "cbc/cbc-biller-projector"
}

module "cbc_charges_publisher_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.charges_events_v1.name, kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-charges-publisher-order-charges-v1"]
  cert_common_name = "cbc/cbc-charges-publisher-processor"
}

module "cbc_charges_publisher_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.charges_events_v1.name, kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-charges-publisher-projector-v2"]
  cert_common_name = "cbc/cbc-charges-publisher-projector"
}

module "cbc_ordering_platform_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-ordering-platform-consumer-v1"]
  cert_common_name = "cbc/cbc-ordering-platform-consumer"
}

module "cbc_ordering_platform_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-ordering-platform-projector-v1"]
  cert_common_name = "cbc/cbc-ordering-platform-projector"
}

module "cbc_mdes_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-mdes-projector"]
  cert_common_name = "cbc/cbc-mdes-projector"
}

module "cbc_mdes_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-mdes-processor"]
  cert_common_name = "cbc/cbc-mdes-processor"
}

module "cbc_topup_capture_retrier" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.topup_events_v1.name]
  produce_topics   = [kafka_topic.topup_events_v1.name]
  consume_groups   = ["cbc.cbc-topup-capture-retrier-v1"]
  cert_common_name = "cbc/cbc-topup-capture-retrier"
}

module "cbc_topup_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.topup_events_v1.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-topup-projector-v1"]
  cert_common_name = "cbc/cbc-topup-projector"
}

module "cbc_topup_refund_retrier" {
  source           = "../../../modules/tls-app"
  consume_topics   = []
  produce_topics   = [kafka_topic.topup_events_v1.name]
  consume_groups   = ["cbc.cbc-topup-low-balance-executor-v1"]
  cert_common_name = "cbc/cbc-topup-refund-retrier"
}

module "cbc_topup_scheduled_topup_job" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.topup_events_v1.name]
  cert_common_name = "cbc/cbc-topup-scheduled-topup-job"
}

module "cbc_topup_low_balance_executor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-topup-low-balance-executor-v1"]
  produce_topics   = [kafka_topic.topup_events_v1.name]
  cert_common_name = "cbc/cbc-topup-processor"
}

module "cbc_topup_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.topup_events_v1.name, kafka_topic.transaction_events_v3.name]
  produce_topics   = [kafka_topic.topup_events_v1.name]
  consume_groups   = ["cbc.cbc-topup-processor-v1"]
  cert_common_name = "cbc/cbc-topup-processor"
}

module "cbc_topup_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.topup_events_v1.name]
  cert_common_name = "cbc/cbc-topup-api"
}

module "cbc_topup_payment_continuer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.topup_events_v1.name]
  cert_common_name = "cbc/cbc-topup-payment-continuer"
}

module "cbc_crm_adapter_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-crm-adapter-projector-v1"]
  cert_common_name = "cbc/cbc-crm-adapter-projector"
}

module "cbc_crm_adapter_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-crm-adapter-processor-v1"]
  cert_common_name = "cbc/cbc-crm-adapter-processor"
}

module "cbc_welcome_bonus_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.topup_events_v1.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-welcome-bonus-projector-v1"]
  cert_common_name = "cbc/cbc-welcome-bonnus-projector"
}

module "cbc_welcome_bonus_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-welcome-bonus-consumer-v1"]
  cert_common_name = "cbc/cbc-welcome-bonnus-consumer"
}

module "cbc_3ds_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-3ds-consumer-v1"]
  cert_common_name = "cbc/cbc-3ds-consumer"
}

module "cbc_3ds_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-3ds-projector-v1"]
  cert_common_name = "cbc/cbc-3ds-projector"
}

module "cbc_3ds_sms_challenge_executor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.challenge_events_v1.name]
  consume_groups   = ["cbc.cbc-3ds-sms-challenge-executor-v1"]
  cert_common_name = "cbc/cbc-3ds-sms-challenge-executor"
}

module "cbc_3ds_apata_webhook" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.challenge_events_v1.name]
  cert_common_name = "cbc/cbc-3ds-apata-webhook"
}

module "cbc_provider_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-provider-api"
}

module "cbc_provider_kyc_cron" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  cert_common_name = "cbc/cbc-provider-kyc-cron"
}

module "cbc_provider_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-provider-projector-v1"]
  cert_common_name = "cbc/cbc-provider-projector"
}

module "cbc_provider_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-provider-consumer-v1"]
  produce_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-provider-consumer"
}

module "cbc_magic_issuer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-magic-issuer"
}

module "cbc_magic_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-magic-projector-v1"]
  cert_common_name = "cbc/cbc-magic-projector"
}

module "cbc_order_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-order-processor-v1"]
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  cert_common_name = "cbc/cbc-order-processor"
}

module "cbc_ownership_check_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-ownership-check-projector-v3"]
  cert_common_name = "cbc/cbc-ownership-check-projector"
}

module "cbc_ownership_check_listener" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-ownership-check-listener-v3"]
  cert_common_name = "cbc/cbc-ownership-check-listener"
}

module "cbc_dispute_credits_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-dispute-credits-api"
}

module "cbc_dispute_credits_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-dispute-credits-consumer-v1"]
  cert_common_name = "cbc/cbc-dispute-credits-consumer"
}

module "cbc_dispute_credits_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-dispute-credits-projector-v3"]
  cert_common_name = "cbc/cbc-dispute-credits-projector"
}

module "cbc_customer_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  cert_common_name = "cbc/cbc-customer-api"
}

module "cbc_tariff_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  cert_common_name = "cbc/cbc-tariff-api"
}

module "cbc_order_processor_cronjob" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  cert_common_name = "cbc/cbc-order-processor-cronjob"
}

module "cbc_tariff_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-tariff-projector-v1"]
  cert_common_name = "cbc/cbc-tariff-projector"
}

module "cbc_customer_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.topup_events_v1.name]
  consume_groups   = ["cbc.cbc-customer-api-v1"]
  cert_common_name = "cbc/cbc-customer-api"
}

module "cbc_transaction_statement_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.topup_events_v1.name, kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.transaction-statement-v1"]
  cert_common_name = "cbc/cbc-transaction-statement-indexer"
}

module "cbc_statement_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-statement-projector-v1"]
  cert_common_name = "cbc/cbc-statement-projector"
}
