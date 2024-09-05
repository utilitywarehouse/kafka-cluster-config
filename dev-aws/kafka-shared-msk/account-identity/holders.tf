resource "kafka_topic" "account-identity_Legacy-account-holder-events-compacted" {
  name               = "account-identity.legacy.account.holder.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "retention.ms" = "604800000	"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "compact"
  }
}

module "account_identity_update-holders" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.account-identity_Legacy-account-holder-events-compacted.name)]
  consume_groups   = ["account-identity.update-holders-projector"]
  cert_common_name = "account-identity/update-holders-projector"
}
