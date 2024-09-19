module "account_identity_proximo" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_legacy_account_events.name, kafka_topic.account_identity_legacy_account_events_compacted.name, kafka_topic.account_identity_account_unified_events.name, kafka_topic.account_identity_legacy_account_changelog_events.name, kafka_topic.account_identity_account_atomic_v1.name, kafka_topic.account_identity_legacy_account_change_events_compacted.name, kafka_topic.account_identity_account_management_events.name, kafka_topic.account_identity_public_account_events.name, kafka_topic.account_identity_staff_okta_v6.name, kafka_topic.account_identity_account_exceptions_events.name]
  consume_groups   = ["account-identity.finance-legacy-account-api", ]
  produce_topics   = []
  cert_common_name = "account-platform/proximo"
}