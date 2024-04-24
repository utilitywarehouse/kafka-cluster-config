# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-changelog-events" {
  name               = "legacy.account.changelog.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-events-compacted" {
  name               = "legacy.account.events.compacted"
  replication_factor = 3
  partitions         = 50
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "account-unified-events" {
  name               = "account.unified.events"
  replication_factor = 3
  partitions         = 50
  config = {
    "cleanup.policy"            = "compact"
    "min.cleanable.dirty.ratio" = "0.01"
    "delete.retention.ms"       = "100"
  }
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-events" {
  name               = "legacy.account.events"
  replication_factor = 3
  partitions         = 50
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-eqdb-events" {
  name               = "legacy.account.eqdb.events"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "internal-legacy-account-events" {
  name               = "internal.legacy.account.events"
  replication_factor = 3
  partitions         = 15
}

# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "legacy-account-events-private" {
  name               = "legacy.account.events.private"
  replication_factor = 3
  partitions         = 15
}
