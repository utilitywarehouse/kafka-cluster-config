module "account_identity_proximo" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.account_identity_account_atomic_v1.name,
    kafka_topic.account_identity_account_exceptions_events.name,
    kafka_topic.account_identity_account_management_events.name,
    kafka_topic.account_identity_account_unified_events.name,
    kafka_topic.account_identity_legacy_account_change_events_compacted.name,
    kafka_topic.account_identity_legacy_account_changelog_events.name,
    kafka_topic.account_identity_legacy_account_events.name,
    kafka_topic.account_identity_legacy_account_events_compacted.name,
    kafka_topic.account_identity_public_account_events.name,
    kafka_topic.account_identity_staff_okta_v6.name
  ]
  consume_groups = [
    "account-identity.account_number_api_reader",
    "account-identity.caps-citizen-creator",
    "account-identity.caps-customers-loader-test",
    "account-identity.cbc-account-events-relay-v2",
    "account-identity.cbc-fraud-detection-consumer-v1",
    "account-identity.contact-channels-legacy-account-events-reader-dev",
    "account-identity.customer-billing-account-platform-projector-billing-communications",
    "account-identity.customer-billing-account-platform-projector-payment-details",
    "account-identity.customer-incentives.legacy-accounts-adapter-03",
    "account-identity.customer-proposition-account-platform-adapter-01",
    "account-identity.customer-support.idv.projector-001",
    "account-identity.debt-collection-comms-api-accounts",
    "account-identity.dex-account-management-projector-2022-07-22-dev",
    "account-identity.dex-account-management-projector-2022-07-22-management-events-dev",
    "account-identity.dex-timeline-emailer-basia1",
    "account-identity.finance-legacy-account-api",
    "account-identity.finance-legacy-account-api",
    "account-identity.finance-legacy-account-api-occupancy-type-reconsumer",
    "account-identity.finserv-benthos-relay",
    "account-identity.fixed-line-accounts-legacy-events-changed-comp",
    "account-identity.fixed-line-accounts-legacy-events-v2",
    "account-identity.iam-account-projector-auth-customer",
    "account-identity.iam-credentials-api-email-projector",
    "account-identity.iam-identitydb-event-forwarder",
    "account-identity.iam-identitydb-event-forwarder",
    "account-identity.insurance-legacy-account-kafka-relay",
    "account-identity.insurance-legacy-account-kafka-relay",
    "account-identity.leads-api-conversion-v1",
    "account-identity.leads-api-indexer-v1",
    "account-identity.mobile-accounts-fraud-events-1",
    "account-identity.mobile-accounts-legacy-events-1",
    "account-identity.ordering-platform-adapter",
    "account-identity.ordering-platform-william-account-history",
    "account-identity.partner-bq-customer-account-indexer-v1",
    "account-identity.partner-customer-account-number-api-v1",
    "account-identity.partner-registration-indexer-v1",
    "account-identity.postgres-indexer-customer-24-09-11",
    "account-identity.public-api-v1",
    "account-identity.referral-portal-221116",
    "account-identity.telecom-accounts-legacy-events"
  ]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name, kafka_topic.account_identity_account_management_events.name]
  cert_common_name = "account-platform/proximo"
}
