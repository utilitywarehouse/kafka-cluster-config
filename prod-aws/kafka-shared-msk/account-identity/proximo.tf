module "account_identity_proximo" {
  source         = "../../../modules/tls-app"
  consume_topics = [kafka_topic.account_identity_legacy_account_events.name, kafka_topic.account_identity_legacy_account_events_compacted.name, kafka_topic.account_identity_account_unified_events.name, kafka_topic.account_identity_legacy_account_changelog_events.name, kafka_topic.account_identity_account_atomic_v1.name, kafka_topic.account_identity_legacy_account_change_events_compacted.name, kafka_topic.account_identity_account_management_events.name, kafka_topic.account_identity_public_account_events.name, kafka_topic.account_identity_staff_okta_v6.name, kafka_topic.account_identity_account_exceptions_events.name]
  consume_groups = ["account-identity.partner-portal-indexer-v1",
    "account-identity.finance-legacy-account-api",
    "account-identity.debt-collection-api",
    "account-identity.caps-citizen-creator",
    "account-identity.dex-timeline-emailer-basia1",
    "account-identity.public-postgres-indexer-customer-v1",
    "account-identity.finance-legacy-account-api-occupancy-type-reconsumer",
    "account-identity.account-discount-accounts-forwarder-new",
    "account-identity.invoice-payment-engine-accounts",
    "account-identity.partner-registration-indexer-v1",
    "account-identity.referral-portal-221116",
    "account-identity.dex-timeline-emailer-1651163926-prod",
    "account-identity.unicom-account-projector-1",
    "account-identity.public-api-v2",
    "account-identity.customer-support.idv.projector-001",
    "account-identity.dex-legacy-account-replicator-2023-02-15",
    "account-identity.energy-account-events-relay",
    "account-identity.caps-customers-loader-prod",
    "account-identity.telecom-accounts-legacy-events",
    "account-identity.dex-account-management-projector-2023-06-26-prod",
    "account-identity.dex-account-management-projector-2023-06-26-management-events-prod",
    "account-identity.customer-incentives.legacy-accounts-adapter-01",
    "account-identity.contact-channels-legacy-account-events-reader-prod",
    "account-identity.leads-api-indexer-v1",
    "account-identity.customer-billing-account-platform-projector-billing-communications-2",
    "account-identity.leads-api-conversion-v1",
    "account-identity.ordering-platform-adapter",
    "account-identity.customer-billing-account-platform-projector-payment-details",
    "account-identity.public-postgres-indexer-customer-v2",
    "account-identity.partner-bq-customer-account-indexer-v1",
    "account-identity.account_number_api_reader",
    "account-identity.ordering-platform-william-account-history",
    "account-identity.partner-customer-account-number-api-v1",
    "account-identity.dex-new-account-application-handler",
    "account-identity.debt-collection-comms-api-accounts",
    "account-identity.fixed-line-accounts-legacy-events",
    "account-identity.mobile-accounts-legacy-events-1"
  ]
  produce_topics   = [kafka_topic.account_identity_internal_legacy_account_events.name, kafka_topic.account_identity_account_management_events.name]
  cert_common_name = "account-platform/proximo"
}
