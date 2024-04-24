<<<<<<< HEAD
resource "kafka_topic" "correspondence_address_exception_check_events" {
  name               = "correspondence.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "correspondence-address-exception-check-events" {
  name               = "correspondence.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
>>>>>>> 2596f0f (Add account-platform topics)
    "retention.ms" = "604800000"
  }
}

<<<<<<< HEAD
resource "kafka_topic" "supply_address_exception_check_events" {
  name               = "supply.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "supply-address-exception-check-events" {
  name               = "supply.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
>>>>>>> 2596f0f (Add account-platform topics)
    "retention.ms" = "604800000"
  }
}

<<<<<<< HEAD
resource "kafka_topic" "supply_address_debt_exception_check_events" {
  name               = "supply.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "supply-address-debt-exception-check-events" {
  name               = "supply.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
>>>>>>> 2596f0f (Add account-platform topics)
    "retention.ms" = "604800000"
  }
}

<<<<<<< HEAD
resource "kafka_topic" "correspondence_address_debt_exception_check_events" {
  name               = "correspondence.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config = {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "correspondence-address-debt-exception-check-events" {
  name               = "correspondence.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
>>>>>>> 2596f0f (Add account-platform topics)
    "retention.ms" = "604800000"
  }
}

<<<<<<< HEAD
resource "kafka_topic" "land_registry_check_events" {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "land-registry-check-events" {
>>>>>>> 2596f0f (Add account-platform topics)
  name               = "land.registry.check.events"
  replication_factor = 3
  partitions         = 15
}

<<<<<<< HEAD
resource "kafka_topic" "account_exceptions_v1" {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-exceptions-v1" {
>>>>>>> 2596f0f (Add account-platform topics)
  name               = "account.exceptions.v1"
  replication_factor = 3
  partitions         = 15
}

<<<<<<< HEAD
resource "kafka_topic" "account_exceptions_events" {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-exceptions-events" {
>>>>>>> 2596f0f (Add account-platform topics)
  name               = "account.exceptions.events"
  replication_factor = 3
  partitions         = 15
}

<<<<<<< HEAD
resource "kafka_topic" "finance_events_compacted" {
=======
# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "finance-events-compacted" {
>>>>>>> 2596f0f (Add account-platform topics)
  name               = "finance.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
