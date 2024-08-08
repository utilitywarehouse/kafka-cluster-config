import {
  to = kafka_topic.public_account_events
  id = "public.account.events"
}

resource "kafka_topic" "public_account_events" {
  config             = {}
  name               = "public.account.events"
  partitions         = 15
  replication_factor = 3
}
