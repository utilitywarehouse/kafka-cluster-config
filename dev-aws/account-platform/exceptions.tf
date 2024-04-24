# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "correspondence-address-exception-check-events" {
  name               = "correspondence.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
    "retention.ms" = "604800000"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "supply-address-exception-check-events" {
  name               = "supply.address.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
    "retention.ms" = "604800000"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "supply-address-debt-exception-check-events" {
  name               = "supply.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
    "retention.ms" = "604800000"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "correspondence-address-debt-exception-check-events" {
  name               = "correspondence.address.debt.exception.check.events"
  replication_factor = 3
  partitions         = 15
  config             = {
    "retention.ms" = "604800000"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "land-registry-check-events" {
  name               = "land.registry.check.events"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-exceptions-v1" {
  name               = "account.exceptions.v1"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-exceptions-events" {
  name               = "account.exceptions.events"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "finance-events-compacted" {
  name               = "finance.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}
