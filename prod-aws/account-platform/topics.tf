import {
  to = kafka_topic.public_account_events
  id = "public.account.events"
}

import {
  to = kafka_topic.account_exceptions_events
  id = "account.exceptions.events"
}

resource "kafka_topic" "public_account_events" {
  config             = {}
  name               = "public.account.events"
  partitions         = 15
  replication_factor = 3
}
