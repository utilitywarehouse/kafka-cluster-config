resource "kafka_topic" "fraud_events" {
  name = "cbc.FraudEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "data_product_events_v1" {
  name = "cbc.DataProductEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"         # keep on each partition unlimited data
    "retention.ms"          = "2629746000" # keep data for 1 month
    "local.retention.ms"    = "18000000"   # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"    # allow for a batch of records maximum 2MiB
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
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
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
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
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
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
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
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
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
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
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
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "openbanking_events_v1" {
  name = "cbc.OpenBankingEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "order_events_v1" {
  name = "cbc.OrderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "paymentology_events_v1" {
  name = "cbc.PaymentologyNotificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "sodexo_events_v1" {
  name = "cbc.SodexoEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "verification_events_v1" {
  name = "cbc.VerificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "customer_events_v1" {
  name = "cbc.CustomerEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "migration_events_v1" {
  name = "cbc.MigrationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "network_events_v1" {
  name = "cbc.NetworkEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "mdes_events_v1" {
  name = "cbc.MdesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "service_events_v1" {
  name = "cbc.ServiceEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "crm_events_v1" {
  name = "cbc.CrmEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "legacy_account_events_v2" {
  name = "cbc.legacy.account.events.v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "eqdb_loader_events_v1" {
  name = "cbc.EqdbLoaderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"       # keep on each partition unlimited data
    "retention.ms"          = "-1"       # keep data forever
    "local.retention.ms"    = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

module "cbc_data_infra_adapter_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.transaction_events_v3.name,
    kafka_topic.mdes_events_v1.name,
    kafka_topic.lifecycle_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-data-infra-adapter-consumer-v1"]
  produce_topics   = [kafka_topic.data_product_events_v1.name]
  cert_common_name = "cbc/cbc-data-infra-adapter-consumer"
}

module "cbc_data_infra_exporter" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.data_product_events_v1.name]
  consume_groups   = ["cbc.cbc-data-infra-exporter-v1"]
  cert_common_name = "cbc/cbc-data-infra-exporter"
}

module "cbc_fraud_detection_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.fraud_events.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.topup_events_v1.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  produce_topics   = [kafka_topic.fraud_events.name]
  consume_groups   = ["cbc.cbc-fraud-detection-consumer-v1"]
  cert_common_name = "cbc/cbc-fraud-detection-consumer"
}

module "cbc_events_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.data_product_events_v1.name,
    kafka_topic.fraud_events.name,
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.charges_events_v1.name,
    kafka_topic.challenge_events_v1.name,
    kafka_topic.topup_events_v1.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.openbanking_events_v1.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.paymentology_events_v1.name,
    kafka_topic.sodexo_events_v1.name,
    kafka_topic.migration_events_v1.name,
    kafka_topic.mdes_events_v1.name,
    kafka_topic.network_events_v1.name,
    kafka_topic.crm_events_v1.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.eqdb_loader_events_v1.name,
    kafka_topic.service_events_v1.name,
    kafka_topic.verification_events_v1.name,
    kafka_topic.customer_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-events-indexer"]
  cert_common_name = "cbc/cbc-events-indexer"
}

module "cbc_fraud_detection_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.fraud_events.name]
  cert_common_name = "cbc/cbc-fraud-detection-api"
}

module "cbc_bigquery_exporter" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.fraud_events.name,
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.charges_events_v1.name,
    kafka_topic.challenge_events_v1.name,
    kafka_topic.topup_events_v1.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.openbanking_events_v1.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.paymentology_events_v1.name,
    kafka_topic.sodexo_events_v1.name,
    kafka_topic.migration_events_v1.name,
    kafka_topic.mdes_events_v1.name,
    kafka_topic.network_events_v1.name,
    kafka_topic.crm_events_v1.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.eqdb_loader_events_v1.name,
    kafka_topic.service_events_v1.name,
    kafka_topic.verification_events_v1.name,
    kafka_topic.customer_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-bigquery-exporter-v1"]
  cert_common_name = "cbc/cbc-bigquery-exporter"
}

module "cbc_insights_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.order_events_v1.name,
  ]
  consume_groups   = ["cbc.cbc-insights-projector"]
  cert_common_name = "cbc/cbc-insights-projector"
}

module "cbc_transaction_notification_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-transaction-notification-projector-v3"]
  cert_common_name = "cbc/cbc-transaction-notification-projector"
}

module "cbc_transaction_notification_mapper" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.paymentology_events_v1.name
  ]
  consume_groups = ["cbc.cbc-transaction-notification-mapper-v2"]
  produce_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  cert_common_name = "cbc/cbc-transaction-notification-mapper"
}

module "cbc_transaction_rater_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-transaction-rater-api"
}

module "cbc_transaction_rater_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.transaction_events_v3.name,
    kafka_topic.sodexo_events_v1.name
  ]
  produce_topics = [
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-transaction-rater-v1"]
  cert_common_name = "cbc/cbc-transaction-rater-consumer"
}

module "cbc_transaction_rater_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.sodexo_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-transaction-rater-projector-v1"]
  cert_common_name = "cbc/cbc-transaction-rater-projector"
}

module "cbc_sodexo_transaction_exporter" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-sodexo-transaction-exporter-v1"]
  cert_common_name = "cbc/cbc-sodexo-transaction-exporter"
}

module "cbc_retailer_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.rating_events_v3.name,
    kafka_topic.lifecycle_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-retailer-projector-v1"]
  cert_common_name = "cbc/cbc-retailer-projector"
}

module "cbc_network_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.rating_events_v3.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.lifecycle_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-network-projector-v4"]
  cert_common_name = "cbc/cbc-network-projector"
}

module "cbc_network_networkb_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.network_events_v1.name]
  consume_groups   = ["cbc.cbc-network-networkb-consumer-v1"]
  cert_common_name = "cbc/cbc-network-networkb-consumer"
}

module "cbc_network_cj_report_cron" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.network_events_v1.name]
  cert_common_name = "cbc/cbc-network-cj-report-cron"
}

module "cbc_network_networkb_report_cron" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.network_events_v1.name]
  cert_common_name = "cbc/cbc-network-networkb-report-cron"
}

module "cbc_network_trc_report_cron" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.network_events_v1.name]
  cert_common_name = "cbc/cbc-network-trc-report-cron"
}

module "cbc_network_awin_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-network-awin-processor-v1"]
  produce_topics   = [kafka_topic.network_events_v1.name]
  cert_common_name = "cbc/cbc-network-awin-processor"
}

module "cbc_network_partnerize_processor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-network-partnerize-processor-v1"]
  produce_topics   = [kafka_topic.network_events_v1.name]
  cert_common_name = "cbc/cbc-network-partnerize-processor"
}

module "cbc_network_sodexo_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.sodexo_events_v1.name]
  consume_groups   = ["cbc.cbc-network-sodexo-consumer-v1"]
  cert_common_name = "cbc/cbc-network-sodexo-consumer"
}

module "cbc_network_sodexo_report_cron" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.sodexo_events_v1.name]
  cert_common_name = "cbc/cbc-network-sodexo-report-cron"
}

module "cbc_network_sodexo_staff_file_processor" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.sodexo_events_v1.name]
  cert_common_name = "cbc/cbc-network-sodexo-staff-file-processor"
}

module "cbc_network_sodexo_customer_file_processor" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.sodexo_events_v1.name]
  cert_common_name = "cbc/cbc-network-sodexo-customer-file-processor"
}

module "cbc_retailer_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.rating_events_v3.name]
  cert_common_name = "cbc/cbc-retailer-api"
}

module "cbc_push_notifications_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.challenge_events_v1.name,
    kafka_topic.transaction_events_v3.name
  ]
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  consume_groups   = ["cbc.cbc-push-notifications-v1"]
  cert_common_name = "cbc/cbc-push-notifications-consumer"
}

module "cbc_push_notifications_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.customer_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-push-notifications-projector-v0.1"]
  cert_common_name = "cbc/cbc-push-notifications-projector"
}

module "cbc_biller_amount_fixer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.charges_events_v1.name]
  cert_common_name = "cbc/cbc-biller-amount-fixer"
}

module "cbc_biller_cronjob" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name, kafka_topic.charges_events_v1.name]
  cert_common_name = "cbc/cbc-biller-cronjob"
}

module "cbc_biller_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.charges_events_v1.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups = ["cbc.cbc-biller-v3"]
  produce_topics = [
    kafka_topic.transaction_events_v3.name,
    kafka_topic.charges_events_v1.name,
  ]
  cert_common_name = "cbc/cbc-biller-consumer"
}

module "cbc_biller_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.charges_events_v1.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-biller-projector-v3"]
  cert_common_name = "cbc/cbc-biller-projector"
}

module "cbc_charges_publisher_monthly_charges_job" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.charges_events_v1.name]
  cert_common_name = "cbc/cbc-charges-publisher-monthly-charges-job"
}

module "cbc_charges_publisher_processor" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.order_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-charges-publisher-order-charges-v1"]
  produce_topics   = [kafka_topic.charges_events_v1.name]
  cert_common_name = "cbc/cbc-charges-publisher-processor"
}

module "cbc_charges_publisher_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.charges_events_v1.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.order_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-charges-publisher-projector-v2"]
  cert_common_name = "cbc/cbc-charges-publisher-projector"
}

module "cbc_ordering_platform_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.order_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-ordering-platform-consumer-v1"]
  cert_common_name = "cbc/cbc-ordering-platform-consumer"
}

module "cbc_ordering_platform_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-ordering-platform-projector-v1"]
  cert_common_name = "cbc/cbc-ordering-platform-projector"
}

module "cbc_mdes_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.mdes_events_v1.name,
    kafka_topic.rating_events_v3.name,
  ]
  consume_groups   = ["cbc.cbc-mdes-projector"]
  cert_common_name = "cbc/cbc-mdes-projector"
}

module "cbc_mdes_processor" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.mdes_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-mdes-processor"]
  cert_common_name = "cbc/cbc-mdes-processor"
}

module "cbc_mdes_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.mdes_events_v1.name]
  cert_common_name = "cbc/cbc-mdes-api"
}

module "cbc_mdes_grpc" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.mdes_events_v1.name]
  cert_common_name = "cbc/cbc-mdes-grpc"
}

module "cbc_topup_capture_retrier" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.topup_events_v1.name
  ]
  produce_topics   = [kafka_topic.topup_events_v1.name]
  consume_groups   = ["cbc.cbc-topup-capture-retrier-v1"]
  cert_common_name = "cbc/cbc-topup-capture-retrier"
}

module "cbc_topup_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.topup_events_v1.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.charges_events_v1.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-topup-projector-v1"]
  cert_common_name = "cbc/cbc-topup-projector"
}

module "cbc_topup_refund_retrier" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.topup_events_v1.name]
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
  cert_common_name = "cbc/cbc-topup-low-balance-executor"
}

module "cbc_topup_processor" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.topup_events_v1.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
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
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.service_events_v1.name,
    kafka_topic.crm_events_v1.name
  ]
  produce_topics = [
    kafka_topic.crm_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-crm-adapter-processor-v1"]
  cert_common_name = "cbc/cbc-crm-adapter-processor"
}

module "cbc_welcome_bonus_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.topup_events_v1.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.customer_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-welcome-bonus-projector-v1"]
  cert_common_name = "cbc/cbc-welcome-bonus-projector"
}

module "cbc_welcome_bonus_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-welcome-bonus-consumer-v1"]
  cert_common_name = "cbc/cbc-welcome-bonus-consumer"
}

module "cbc_3ds_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.customer_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-3ds-consumer-v1"]
  cert_common_name = "cbc/cbc-3ds-consumer"
}

module "cbc_3ds_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.transaction_events_v3.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.customer_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-3ds-projector-v1"]
  cert_common_name = "cbc/cbc-3ds-projector"
}

module "cbc_3ds_sms_challenge_executor" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.challenge_events_v1.name]
  consume_groups   = ["cbc.cbc-3ds-sms-challenge-executor-v1"]
  produce_topics   = [kafka_topic.challenge_events_v1.name]
  cert_common_name = "cbc/cbc-3ds-sms-challenge-executor"
}

module "cbc_3ds_apata_webhook" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.challenge_events_v1.name]
  cert_common_name = "cbc/cbc-3ds-apata-webhook"
}

module "cbc_provider_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.mdes_events_v1.name,
    kafka_topic.service_events_v1.name
  ]
  cert_common_name = "cbc/cbc-provider-api"
}

module "cbc_provider_kyc_cron" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  cert_common_name = "cbc/cbc-provider-kyc-cron"
}

module "cbc_provider_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.transaction_events_v3.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.verification_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-provider-projector-v1"]
  cert_common_name = "cbc/cbc-provider-projector"
}

module "cbc_provider_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.verification_events_v1.name,
    kafka_topic.order_events_v1.name
  ]
  consume_groups = ["cbc.cbc-provider-consumer-v1"]
  produce_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.service_events_v1.name
  ]
  cert_common_name = "cbc/cbc-provider-consumer"
}

module "cbc_provider_card_replacer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.order_events_v1.name]
  cert_common_name = "cbc/cbc-provider-card-replacer"
}

module "cbc_magic_issuer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-magic-issuer"
}

module "cbc_magic_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-magic-projector-v1"]
  cert_common_name = "cbc/cbc-magic-projector"
}

module "cbc_order_processor" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.verification_events_v1.name
  ]
  consume_groups = ["cbc.cbc-order-processor-v1"]
  produce_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.order_events_v1.name
  ]
  cert_common_name = "cbc/cbc-order-processor"
}

module "cbc_order_processor_cronjob" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.order_events_v1.name
  ]
  cert_common_name = "cbc/cbc-order-processor-cronjob"
}

module "cbc_ownership_check_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.verification_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-ownership-check-projector-v3"]
  cert_common_name = "cbc/cbc-ownership-check-projector"
}

module "cbc_ownership_check_listener" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.order_events_v1.name,
    kafka_topic.verification_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-ownership-check-listener-v3"]
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-ownership-check-listener"
}

module "cbc_ownership_check_cronjob" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-ownership-check-cronjob"
}

module "cbc_dispute_credits_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.transaction_events_v3.name]
  cert_common_name = "cbc/cbc-dispute-credits-api"
}

module "cbc_dispute_credits_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.transaction_events_v3.name
  ]
  produce_topics = [
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.cbc-dispute-credits-consumer-v1"]
  cert_common_name = "cbc/cbc-dispute-credits-consumer"
}

module "cbc_dispute_credits_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name,
    kafka_topic.transaction_events_v3.name,
    kafka_topic.mdes_events_v1.name,
  ]
  consume_groups   = ["cbc.cbc-dispute-credits-projector-v3"]
  cert_common_name = "cbc/cbc-dispute-credits-projector"
}

module "cbc_customer_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.customer_events_v1.name
  ]
  cert_common_name = "cbc/cbc-customer-api"
}

module "cbc_customer_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.legacy_account_events_v2.name
  ]
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-customer-consumer-v1"]
  cert_common_name = "cbc/cbc-customer-consumer"
}

module "cbc_customer_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.order_events_v1.name,
    kafka_topic.verification_events_v1.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.customer_events_v1.name
  ]
  consume_groups = [
    "cbc.cbc-customer-api-v1"
  ]
  cert_common_name = "cbc/cbc-customer-projector"
}

module "cbc_tariff_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  cert_common_name = "cbc/cbc-tariff-api"
}

module "cbc_tariff_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  produce_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-tariff-consumer-v1"]
  cert_common_name = "cbc/cbc-tariff-consumer"
}

module "cbc_tariff_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.lifecycle_events_v2.name]
  consume_groups   = ["cbc.cbc-tariff-projector-v1"]
  cert_common_name = "cbc/cbc-tariff-projector"
}

module "cbc_transaction_statement_indexer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.topup_events_v1.name,
    kafka_topic.transaction_events_v3.name
  ]
  consume_groups   = ["cbc.transaction-statement-v1"]
  cert_common_name = "cbc/cbc-transaction-statement-indexer"
}

module "cbc_statement_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.transaction_events_v3.name,
    kafka_topic.lifecycle_events_v2.name,
  ]
  consume_groups   = ["cbc.cbc-statement-projector-v1", "cbc.cbc-statement-projector-v2"]
  cert_common_name = "cbc/cbc-statement-projector"
}

module "cbc_openbanking_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.openbanking_events_v1.name]
  consume_groups   = ["cbc.cbc-openbanking-consumer-v1"]
  cert_common_name = "cbc/cbc-openbanking-consumer"
}

module "cbc_openbanking_listener" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.openbanking_events_v1.name]
  consume_groups   = ["cbc.cbc-open-banking-listener-v1"]
  produce_topics   = [kafka_topic.openbanking_events_v1.name]
  cert_common_name = "cbc/cbc-openbanking-listener"
}

module "cbc_openbanking_api" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.openbanking_events_v1.name]
  consume_groups   = ["cbc.cbc-openbanking-api-v1"]
  produce_topics   = [kafka_topic.openbanking_events_v1.name]
  cert_common_name = "cbc/cbc-openbanking-api"
}

module "cbc_tac_comms_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.order_events_v1.name]
  consume_groups   = ["cbc.cbc-tac-comms-consumer-v1"]
  cert_common_name = "cbc/cbc-tac-comms-consumer"
}

module "cbc_pep_checker_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.order_events_v1.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.verification_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-pep-checker-projector-v1"]
  cert_common_name = "cbc/cbc-pep-checker-projector"
}

module "cbc_pep_checker" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.order_events_v1.name,
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.verification_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-pep-checker-v8"]
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-pep-checker"
}

module "cbc_pep_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-pep-api"
}

module "cbc_ordering_api" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.order_events_v1.name,
    kafka_topic.lifecycle_events_v2.name
  ]
  consume_groups = ["cbc.cbc-ordering-api-v2"]
  produce_topics = [
    kafka_topic.order_events_v1.name,
    kafka_topic.service_events_v1.name
  ]
  cert_common_name = "cbc/cbc-ordering-api"
}

module "cbc_onfido_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.verification_events_v1.name,
    kafka_topic.order_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-onfido-projector-v2"]
  cert_common_name = "cbc/cbc-onfido-projector"
}

module "cbc_onfido_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.order_events_v1.name,
    kafka_topic.verification_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-onfido-consumer-v2"]
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-onfido-consumer"
}

module "cbc_onfido_webhooks" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-onfido-webhooks"
}

module "cbc_onfido_grpc" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-onfido-grpc"
}

module "cbc_onfido_cronjob" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.verification_events_v1.name]
  cert_common_name = "cbc/cbc-onfido-cronjob"
}

module "cbc_paymentology_notifications" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.paymentology_events_v1.name]
  cert_common_name = "cbc/cbc-paymentology-notifications"
}

module "cbc_paymentology_file_processor" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.paymentology_events_v1.name]
  cert_common_name = "cbc/cbc-paymentology-file-processor"
}

module "cbc_account_services_fabricator" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.customer_events_v1.name]
  cert_common_name = "cbc/cbc-account-services-fabricator"
}

module "cbc_account_services_fabricator_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.customer_events_v1.name,
    kafka_topic.legacy_account_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-account-services-fabricator-projector-v1"]
  cert_common_name = "cbc/cbc-account-services-fabricator-projector"
}

module "cbc_customer_information_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.legacy_account_events_v2.name]
  consume_groups   = ["cbc.cbc-customer-information-consumer-v1"]
  cert_common_name = "cbc/cbc-customer-information-consumer"
}

module "cbc_legacy_account_eqdb_loader" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.eqdb_loader_events_v1.name]
  cert_common_name = "cbc/cbc-legacy-account-eqdb-loader"
}

module "cbc_account_events_relay" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.legacy_account_events_v2.name]
  cert_common_name = "cbc/cbc-account-events-relay-v2"
}

module "cbc_data_infra_adapter_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-data-infra-adapter-projector"]
  cert_common_name = "cbc/cbc-data-infra-adapter-projector"
}

module "cbc_bill_integration_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-bill-integration-projector-v2"]
  cert_common_name = "cbc/cbc-bill-integration-projector"
}

module "cbc_bill_integration_consumer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.legacy_account_events_v2.name
  ]
  consume_groups   = ["cbc.cbc-bill-integration-consumer-v2"]
  cert_common_name = "cbc/cbc-bill-integration-consumer"
}

module "cbc_crm_services_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.crm_events_v1.name
  ]
  consume_groups   = ["cbc.cbc-service-projector-v1"]
  cert_common_name = "cbc/crm-services-projector"
}

module "cbc_proximo_tls" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.lifecycle_events_v2.name,
    kafka_topic.crm_events_v1.name,
    kafka_topic.service_events_v1.name,
  ]
  consume_groups = [
    "cbc.partner-customer-event-emitter-reader-20220208-01",
    "cbc.customer-proposition-cbc-loader-8",
    "cbc.customer-proposition-cbc-loader-6",
    "cbc.cbc-service-projector-v1",
  ]
  cert_common_name = "cbc/proximo-tls"
}
