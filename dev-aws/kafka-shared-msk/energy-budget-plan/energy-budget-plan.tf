resource "kafka_topic" "eqdb_loader" {
  name               = "energy-budget-plan.eqdb-loader"
  replication_factor = 3
  partitions         = 1
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 18 hours
    "retention.ms" = "64800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "eqdb_loader_process" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.eqdb_loader.name]
  cert_common_name = "energy-budget-plan/eqdb-loader"
}

module "budget_plan_fabricator" {
  source           = "../../../modules/tls-app"
  consume_topics   = { (kafka_topic.eqdb_loader.name) : "energy-budget-plan.eqdb-fabricator-v1" }
  cert_common_name = "energy-budget-plan/eqdb-fabricator"
}

resource "kafka_topic" "budget_plan" {
  name               = "energy-budget-plan.budget-plan"
  replication_factor = 3
  partitions         = 10
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 7 years
    "retention.ms" = "220898482000"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "customer_change" {
  name               = "energy-budget-plan.customer-change"
  replication_factor = 3
  partitions         = 10
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 2 years
    "retention.ms" = "63113852000"
    # keep data in hot storage for 7 days
    "local.retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "budget_plan_calculator" {
  source           = "../../../modules/tls-app"
  consume_topics   = { (kafka_topic.budget_plan.name) : "energy-budget-plan.calculator-v1" }
  cert_common_name = "energy-budget-plan/calculator"
}