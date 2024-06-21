resource "kafka_topic" "fwf_load_failures" {
  name               = "fwf-load-failures"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000" # 30 days
  }
}

resource "kafka_topic" "bill_extracts_historic_model" {
  name               = "bill-extracts-historic-model"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000" # 7 days
  }
}

resource "kafka_topic" "bills_deadletter" {
  name               = "bills.deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "604800000" # 7 days
  }
}

resource "kafka_topic" "billing_engine_events" {
  name               = "billing-engine-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "retention.bytes" = "-1"
    "retention.ms"    = "-1"
  }
}
