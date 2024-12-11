module "account_identity_di_addr_lookup" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_address_lookup_analytics_v1.name]
  consume_groups   = ["account-identity.di-kafka-source-address-lookup-analytics"]
  cert_common_name = "account-platform/di_addr_lookup"
}

module "account_identity_di_exceptions" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.account_identity_account_exceptions_v1.name]
  consume_groups = ["account-identity.di-kafka-source-correspondence-address-bad-debt-cancelled", "account-identity.di-kafka-source-correspondence-address-bad-debt-check-passed", "account-identity.di-kafka-source-correspondence-address-bad-debt-check-skipped",
    "account-identity.di-kafka-source-correspondence-address-bad-debt-created", "account-identity.di-kafka-source-corr-address-debt-payment-requested", "account-identity.di-kafka-source-correspondence-address-bad-debt-proof-requested", "account-identity.di-kafka-source-correspondence-address-bad-debt-resolved",
    "account-identity.di-kafka-source-correspondence-address-match-cancelled", "account-identity.di-kafka-source-correspondence-address-match-check-passed", "account-identity.di-kafka-source-correspondence-address-match-check-skipped", "account-identity.di-kafka-source-correspondence-address-match-created",
    "account-identity.di-kafka-source-correspondence-address-match-deposit-requested", "account-identity.di-kafka-source-correspondence-address-match-resolved", "account-identity.di-kafka-source-land-registry-exception-cancelled",
    "account-identity.di-kafka-source-land-registry-exception-check-attempt-failed", "account-identity.di-kafka-source-land-registry-exception-check-marked-as-failed", "account-identity.di-kafka-source-land-registry-exception-created",
    "account-identity.di-kafka-source-land-registry-exception-deferred", "account-identity.di-kafka-source-land-registry-exception-letter-sent", "account-identity.di-kafka-source-land-registry-exception-resolved",
    "account-identity.di-kafka-source-supply-address-bad-debt-cancelled", "account-identity.di-kafka-source-supply-address-bad-debt-check-passed", "account-identity.di-kafka-source-supply-address-bad-debt-check-skipped", "account-identity.di-kafka-source-supply-address-bad-debt-created",
    "account-identity.di-kafka-source-supply-address-bad-debt-payment-requested", "account-identity.di-kafka-source-supply-address-bad-debt-proof-requested", "account-identity.di-kafka-source-supply-address-bad-debt-resolved",
    "account-identity.di-kafka-source-supply-address-match-cancelled", "account-identity.di-kafka-source-supply-address-match-check-passed", "account-identity.di-kafka-source-supply-address-match-check-skipped", "account-identity.di-kafka-source-supply-address-match-created",
  "account-identity.di-kafka-source-supply-address-match-handed-over", "account-identity.di-kafka-source-supply-address-match-resolved", "account-identity.account-identity.di-kafka-source-supply-address-match-cancelled"]
  cert_common_name = "account-platform/di_exceptions"
}

module "account_identity_di_legacy_account" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.account_identity_internal_legacy_account_events.name, kafka_topic.account_identity_legacy_account_events.name, kafka_topic.account_identity_legacy_account_braze_events_compacted.name]
  consume_groups = ["account-identity.di-kafka-source-account-dob-one",
    "account-identity.di-kafka-source-account-dob-two",
    "account-identity.di-kafka-source-account-label",
    "account-identity.di-kafka-source-account-occupancy-type",
    "account-identity.di-kafka-source-correspondence-address",
    "account-identity.di-kafka-source-correspondence-email",
    "account-identity.di-kafka-source-correspondence-landline",
    "account-identity.di-kafka-source-correspondence-mobile",
    "account-identity.di-kafka-source-correspondence-name",
    "account-identity.di-kafka-source-legacy-account",
    "account-identity.di-kafka-source-legacy-account-braze",
    "account-identity.di-kafka-source-residential-account-created",
    "account-identity.di-kafka-source-supply-address",
    "account-identity.di-kafka-source-supply-email",
    "account-identity.di-kafka-source-supply-landline",
    "account-identity.di-kafka-source-supply-mobile",
    "account-identity.di-kafka-source-supply-name",
  ]
  cert_common_name = "account-platform/di_legacy_account"

module "account_identity_di_business_events" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_account_events_v2.name]
  consume_groups   = ["account-identity.di-kafka-source-business-events"]
  cert_common_name = "account-platform/di_business_events"
}
