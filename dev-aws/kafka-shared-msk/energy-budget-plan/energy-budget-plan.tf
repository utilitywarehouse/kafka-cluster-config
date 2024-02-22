resource "kafka_topic" "eqbd_loader" {
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
  produce_topics   = [kafka_topic.eqbd_loader.name]
  cert_common_name = "energy-budget-plan/eqdb-loader"
}

module "budget_plan_fabricator" {
  source           = "../../../modules/tls-app"
  consume_topics   = { (kafka_topic.eqbd_loader.name) : "energy-budget-plan.eqdb-fabricator-v1" }
  cert_common_name = "energy-budget-plan/budget-plan-eqdb-fabricator"
}

#- max_message_bytes: "104857600" - 100MB !
#  max_retention_bytes: "805306368000" - 768000MB !
#  name: budget-plan
#  partitions: 10
#  replication_factor: 3
#  topic_compression: snappy
#  max_retention_time: "3024000000"

resource "kafka_topic" "budget_plan" {
  name               = "energy-budget-plan.budget-plan"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition - TODO
    "retention.bytes" = "104857600"
    # keep data for 5 weeks
    "retention.ms" = "3024000000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

#- max_message_bytes: "104857600"
#  max_retention_bytes: "805306368000"
#  name: customer-change
#  partitions: 10
#  replication_factor: 3
#  topic_compression: snappy

resource "kafka_topic" "customer_change" {
  name               = "energy-budget-plan.customer-change"
  replication_factor = 3
  partitions         = 10
  config = {
    # retain 100MB on each partition - TODO
    "retention.bytes" = "104857600"
    # keep data for 5 weeks - TODO not set in Kafka Topic applier https://github.com/utilitywarehouse/kubernetes-manifests/blob/d632983de4052ff8f33ccdd37ba886a16b322a49/prod-aws/customer-billing/kafka-topic-applier/topics.yaml#L98-L103
    "retention.ms" = "3024000000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
