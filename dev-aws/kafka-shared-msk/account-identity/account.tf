resource "kafka_topic" "account_identity_account_events_v2" {
  config = {
    "compression.type" = "zstd"
  }
  name               = "account-identity.account.events.v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_atomic_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
  }
  name               = "account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_unified_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"
  }
  name               = "account-identity.account.unified.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_dev_account_events_anonymized_v0" {
  config = {
    "compression.type" = "zstd"
  }
  name               = "account-identity.dev.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_from_prod_account_events_anonymized_v0" {
  config = {
    "compression.type" = "zstd"
  }
  name               = "account-identity.from-prod.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_public_account_events" {
  config = {
    "compression.type" = "zstd"
  }
  name               = "account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_management_events" {
  config = {
    "cleanup.policy"        = "compact"
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"
  }
  name               = "account-identity.account.management.events"
  partitions         = 15
  replication_factor = 3
}
