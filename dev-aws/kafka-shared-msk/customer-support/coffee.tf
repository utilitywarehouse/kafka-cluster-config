resource "kafka_topic" "coffee_account_history_v1" {
  config = {
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for a day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms" = "-1"
  }
  name               = "customer-support.coffee_account_history_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "coffee_services" {
  config = {
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for a day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms" = "-1"
  }
  name               = "customer-support.coffee_services"
  partitions         = 1
  replication_factor = 3
}

module "coffee_account_history_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/coffee-account-history-projector"
  consume_topics   = [kafka_topic.coffee_account_history_v1.name]
  consume_groups   = ["customer-support.coffee-account-history-projector-002"]
}

module "coffee_services_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/coffee-services-projector"
  consume_topics   = [kafka_topic.coffee_services.name]
  consume_groups   = ["customer-support.coffee-services-projector-001"]
}

module "coffee_service" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/coffee-actions"
  produce_topics   = [kafka_topic.coffee_services.name]
}

module "coffee_actions" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/coffee-actions"
  produce_topics   = [kafka_topic.coffee_account_history_v1.name]
}