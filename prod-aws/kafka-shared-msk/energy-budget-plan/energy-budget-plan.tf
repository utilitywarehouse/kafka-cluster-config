resource "kafka_topic" "eqdb_loader" {
  name               = "energy-budget-plan.eqdb-loader"
  replication_factor = 3
  partitions         = 1
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 18 hours
    "retention.ms" = "64800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
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
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
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
    # keep data in primary storage for 7 days
    "local.retention.ms" = "604800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "fabricator_deadletter" {
  name               = "energy-budget-plan.fabricator-deadletter"
  replication_factor = 3
  partitions         = 3
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 2 months
    "retention.ms" = "5259600000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
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
  consume_topics   = [kafka_topic.eqdb_loader.name, kafka_topic.customer_change.name]
  consume_groups   = ["energy-budget-plan.eqdb-fabricator-loader-v1", "energy-budget-plan.eqdb-fabricator-customer-change-v1"]
  produce_topics   = [kafka_topic.customer_change.name, kafka_topic.fabricator_deadletter.name]
  cert_common_name = "energy-budget-plan/eqdb-fabricator"
}

module "budget_plan_calculator" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.budget_plan.name]
  consume_groups   = ["energy-budget-plan.calculator-v1"]
  produce_topics   = [kafka_topic.budget_plan.name]
  cert_common_name = "energy-budget-plan/calculator"
}

module "budget_plan_di_kafka_source_requests" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.budget_plan.name]
  consume_groups   = ["energy-budget-plan.di-kafka-source-calculation-requests-v1"]
  cert_common_name = "energy-budget-plan/di-kafka-source-calculation-requests"
}

module "budget_plan_di_kafka_source_recommendation" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.budget_plan.name]
  consume_groups   = ["energy-budget-plan.di-kafka-source-recommendations-v1"]
  cert_common_name = "energy-budget-plan/di-kafka-source-recommendations"
}
