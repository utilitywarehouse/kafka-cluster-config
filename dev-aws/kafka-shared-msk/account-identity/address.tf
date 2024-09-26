import {
  to = kafka_topic.account_identity_address_lookup_analytics_v1
  id = "account-identity.address.lookup.analytics.v1"
}

resource "kafka_topic" "account_identity_address_lookup_analytics_v1" {
  config = {

    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "account-identity.address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}
