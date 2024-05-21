resource "kafka_topic" "e2e_proto" {
  name               = "data-infra.e2e.proto"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "false"
    # 1 day
    "retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "e2e_json" {
  name               = "data-infra.e2e.json"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "false"
    # 1 day
    "retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "e2e_multi" {
  name               = "data-infra.e2e.multi"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "false"
    # 1 day
    "retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "orchestrator" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.events_send.name]
  consume_groups = [
    "data-infra.di-orchestrator-job-prod-gcp",
    "data-infra.di-orchestrator-job-prod-merit",
    "data-infra.di-orchestrator-job-prod-aws"
  ]
  produce_topics = [
    kafka_topic.e2e_proto.name,
    kafka_topic.e2e_json.name
  ]
  cert_common_name = "data-infra/orchestrator"
}

module "kafka_source_proto" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_proto.name]
  consume_groups = [
    "data-infra.di-kafka-source-prod-gcp",
    "data-infra.di-kafka-source-prod-merit",
    "data-infra.di-kafka-source-prod-aws"
  ]
  cert_common_name = "data-infra/kafka-source"
}

module "kafka_source_json" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_json.name]
  consume_groups = [
    "data-infra.di-kafka-json-source-prod-gcp",
    "data-infra.di-kafka-json-source-prod-merit",
    "data-infra.di-kafka-json-source-prod-aws"
  ]
  cert_common_name = "data-infra/kafka-source-json"
}

module "kafka_source_multi" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_multi.name]
  consume_groups = [
    "data-infra.di-kafka-json-source-prod-gcp",
    "data-infra.di-kafka-json-source-prod-merit",
    "data-infra.di-kafka-json-source-prod-aws"
  ]
  cert_common_name = "data-infra/kafka-source-multi"
}
