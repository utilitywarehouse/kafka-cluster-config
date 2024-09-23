resource "kafka_topic" "account_identity_account_events_v2" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 3 days
    "local.retention.ms" = "259200000"
  }
  name               = "account-identity.account.events.v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_atomic_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
  }
  name               = "account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_unified_events" {
  config = {
    "cleanup.policy" = "compact"
    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
  }
  name               = "account-identity.account.unified.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_public_account_events" {
  config = {
    "compression.type" = "zstd"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_management_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

    # compaction lag of 7 days
    "max.compaction.lag.ms" = "604800000"
    # infinite retention
    "retention.ms" = "-1"
  }
  name               = "account-identity.account-management-events-green"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_to_anonymize_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # retention of 7 days
    "retention.ms" = "604800000"
  }
  name               = "account-identity.to.anonymize"
  partitions         = 15
  replication_factor = 3
}
