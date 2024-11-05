resource "kafka_topic" "e2e_proto" {
  name               = "data-infra.e2e.proto"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MB
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
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MB
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
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "e2e_multi_dpd" {
  name               = "data-infra.e2e.multi-dpd"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "e2e_non_std_envelope" {
  name               = "data-infra.e2e.non-std-envelope"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "e2e_multi_project" {
  name               = "data-infra.e2e.multi_project"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}


module "orchestrator" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.events_end.name]
  consume_groups = [
    "data-infra.di-orchestrator-job-dev-gcp",
    "data-infra.di-orchestrator-job-dev-merit",
    "data-infra.di-orchestrator-job-dev-aws"
  ]
  produce_topics = [
    kafka_topic.e2e_proto.name,
    kafka_topic.e2e_json.name,
    kafka_topic.e2e_multi_dpd.name,
    kafka_topic.e2e_non_std_envelope.name,
    kafka_topic.e2e_multi_project.name
  ]
  cert_common_name = "data-infra/orchestrator"
}

module "kafka_source_proto" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_proto.name]
  consume_groups = [
    "data-infra.di-kafka-source-dev-gcp",
    "data-infra.di-kafka-source-dev-merit",
    "data-infra.di-kafka-source-dev-aws"
  ]
  cert_common_name = "data-infra/kafka-source"
}

module "kafka_source_json" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_json.name]
  consume_groups = [
    "data-infra.di-kafka-json-source-dev-gcp",
    "data-infra.di-kafka-json-source-dev-merit",
    "data-infra.di-kafka-json-source-dev-aws"
  ]
  cert_common_name = "data-infra/kafka-source-json"
}

module "kafka_source_multi" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_multi.name]
  consume_groups = [
    "data-infra.di-kafka-source-multi-egress-dev-gcp",
    "data-infra.di-kafka-source-multi-egress-dev-merit",
    "data-infra.di-kafka-source-multi-egress-dev-aws"
  ]
  cert_common_name = "data-infra/kafka-source-multi"
}

module "kafka_source_multi_dpd" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_multi_dpd.name]
  consume_groups = [
    "data-infra.di-kafka-source-multi-dpd-dev-gcp",
    "data-infra.di-kafka-source-multi-dpd-dev-merit",
    "data-infra.di-kafka-source-multi-dpd-dev-aws"
  ]
  cert_common_name = "data-infra/kafka-source-multi-dpd"
}

module "kafka_source_non_std_envelope" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_non_std_envelope.name]
  consume_groups = [
    "data-infra.kafka-source-non-std-envelope-dev-gcp",
  ]
  cert_common_name = "data-infra/kafka-source-non-std-envelope"
}

module "kafka_source_bq_multi_project" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.e2e_multi_project.name]
  consume_groups = [
    "data-infra.kafka-source-multi-project-dev-gcp",
  ]
  cert_common_name = "data-infra/kafka-source-multi-project"
}
