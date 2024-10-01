resource "kafka_topic" "account_history_eqdb_notifications_v1" {
  config = {
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms" = "64800000"
  }
  name               = "customer-support.account_history_eqdb_notifications_v1"
  partitions         = 1
  replication_factor = 3
}

module "account_history_eqdb_loader_postgres" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/account-history-eqdb-loader-postgres"
  produce_topics   = [kafka_topic.account_history_eqdb_notifications_v1.name]
}

module "bill_account_history_etl" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/bill-account-history-etl"
  consume_topics   = [(kafka_topic.account_history_eqdb_notifications_v1.name)]
  consume_groups   = ["customer-support.bill-account-history-etl"]
}
