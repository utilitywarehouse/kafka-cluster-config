import {
  to = kafka_topic.account_identity_staff_okta_v6
  id = "account-identity.staff.okta.v6"
}

resource "kafka_topic" "account_identity_staff_okta_v6" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}