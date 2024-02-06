resource "kafka_topic" "iam_identitydb_v1" {
  name               = "auth.iam-identitydb-v1"
  replication_factor = 3
  # MUST be 1 partition as identitydb assumes this to be true
  partitions         = 1
  config             = {
    # retain 100MB on each partition
    "retention.bytes"   = "104857600"
    # keep data for 30 days
    "retention.ms"      = "2592000000"
    # allow max 5 MB for a message
    "max.message.bytes" = "5242880"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "iam_identitydb_event_forwarder" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.iam_identitydb_v1.name]
  cert_common_name = "auth/iam-identitydb-event-forwarder"
}

module "iam_identitydb_snapshotter" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_identitydb_v1.name) : "iam-identitydb-snapshotter" }
  cert_common_name = "auth/iam-identitydb-snapshotter"
}

module "iam_identity_api" {
  source           = "../../modules/tls-app"
  consume_topics   = { (kafka_topic.iam_identitydb_v1.name) : "iam-identity-api" }
  cert_common_name = "auth/iam-identity-api"
}

module "iam_policy_decision_api" {
  source           = "../../modules/tls-app"
  cert_common_name = "auth/iam-policy-decision-api"
  produce_topics   = [kafka_topic.iam_cerbos_audit_v1.name]
  consume_topics   = { (kafka_topic.iam_identitydb_v1.name) : "iam-policy-decision-api" }
}

moved {
  from = module.iam_policy_decision_api.kafka_quota.producer_quota
  to   = module.iam_policy_decision_api.kafka_quota.quota
}

moved {
  from = module.iam_identitydb_snapshotter_consumer.kafka_acl.group_acl
  to   = module.iam_identitydb_snapshotter.kafka_acl.group_acl["auth.iam-identitydb-v1"]
}

moved {
  from = module.iam_identitydb_snapshotter_consumer.kafka_acl.topic_acl
  to   = module.iam_identitydb_snapshotter.kafka_acl.topic_acl["auth.iam-identitydb-v1"]
}

moved {
  from = module.iam_identitydb_snapshotter_consumer.kafka_quota.consumer_quota
  to   = module.iam_identitydb_snapshotter.kafka_quota.quota
}

moved {
  from = module.iam_identitydb_identity_api_consumer.kafka_acl.topic_acl
  to   = module.iam_identity_api.kafka_acl.topic_acl["auth.iam-identitydb-v1"]
}

moved {
  from = module.iam_identitydb_identity_api_consumer.kafka_acl.group_acl
  to   = module.iam_identity_api.kafka_acl.group_acl["auth.iam-identitydb-v1"]
}

moved {
  from = module.iam_identitydb_identity_api_consumer.kafka_quota.consumer_quota
  to   = module.iam_identity_api.kafka_quota.quota
}

moved {
  from = module.iam_identitydb_event_forwarder_producer.kafka_acl.producer_acl
  to   = module.iam_identitydb_event_forwarder.kafka_acl.producer_acl["auth.iam-identitydb-v1"]
}

moved {
  from = module.iam_identitydb_event_forwarder_producer.kafka_quota.producer_quota
  to   = module.iam_identitydb_event_forwarder.kafka_quota.quota
}
