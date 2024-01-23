resource "kafka_topic" "iam_identitydb_v1" {
  name               = "auth.iam-identitydb-v1"
  replication_factor = 3
  # MUST be 1 partition as identitydb assumes this to be true
  partitions         = 1
  config = {
    # retain 100MB on each partition
    "retention.bytes" = "104857600"
    # keep data for 30 days
    "retention.ms" = "2592000000"
    # allow max 5 MB for a message
    "max.message.bytes" = "5242880"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_identitydb_event_forwarder_producer" {
  source = "../../modules/producer"

  topic = kafka_topic.iam_identitydb_v1.name

  cert_common_name = "auth/iam-identitydb-event-forwarder"
}

module "iam_identitydb_snapshotter_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.iam_identitydb_v1.name
  consumer_group = "iam-identitydb-snapshotter-v1"

  cert_common_name = "auth/iam-identitydb-snapshotter"
}

module "iam_identitydb_identity_api_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.iam_identitydb_v1.name
  consumer_group = "iam-identity-api-v1"

  cert_common_name = "auth/iam-identity-api"
}

module "iam_identitydb_policy_decision_api_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.iam_identitydb_v1.name
  consumer_group = "iam-policy-decision-api-v1"

  cert_common_name = "auth/iam-policy-decision-api"
}
