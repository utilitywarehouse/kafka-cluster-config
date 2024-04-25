resource "kafka_topic" "correspondence_address_exception_check_events" {
  name               = "correspondence.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "retention.ms" = "604800000"
  }
}

resource "kafka_topic" "supply_address_exception_check_events" {
  name               = "supply.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "retention.ms" = "604800000"
  }
}

resource "kafka_topic" "supply_address_debt_exception_check_events" {
  name               = "supply.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "retention.ms" = "604800000"
  }
}

resource "kafka_topic" "correspondence_address_debt_exception_check_events" {
  name               = "correspondence.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "retention.ms" = "604800000"
  }
}

resource "kafka_topic" "land_registry_check_events" {
  name               = "land.registry.check.events"
  replication_factor = 3
  partitions         = 15
}

resource "kafka_topic" "account_exceptions_v1" {
  name               = "account.exceptions.v1"
  replication_factor = 3
  partitions         = 15
}

resource "kafka_topic" "account_exceptions_events" {
  name               = "account.exceptions.events"
  replication_factor = 3
  partitions         = 15
}

resource "kafka_topic" "finance_events_compacted" {
  name               = "finance.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
