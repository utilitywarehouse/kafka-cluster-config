resource "kafka_topic" "account_identity_staff_okta_v6" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}

module "account_identity_staff_okta_producer" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_staff_okta_v6.name]
  cert_common_name = "account-platform/staff_okta_producer"
}

module "account_identity_okta_staff_events_indexer" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_staff_okta_v6.name]
  consume_groups   = ["account-identity.staff-okta-events-v6-aws"]
  cert_common_name = "account-platform/okta_staff_events_indexer"
}

module "account_identity_crm_okta_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.account_identity_staff_okta_v6.name]
  consume_groups   = ["customer-support.staff.okta.ticketing.20240313-1234"]
  cert_common_name = "crm/okta-projector"
}
