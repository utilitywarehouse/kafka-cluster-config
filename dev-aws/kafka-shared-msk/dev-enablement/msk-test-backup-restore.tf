resource "kafka_topic" "msk_backup_source1" {
  name               = "dev-enablement.msk-backup-source1"
  replication_factor = 3
  partitions         = 3
  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 3 days
    "retention.ms" = "259200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "msk_backup_source2" {
  name               = "dev-enablement.msk-backup-source2"
  replication_factor = 3
  partitions         = 3
  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 3 days
    "retention.ms" = "259200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "msk_backup_target1" {
  name               = "dev-enablement.msk-backup-target1"
  replication_factor = 3
  partitions         = 3
  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 3 days
    "retention.ms" = "259200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "service_status_v3_restore" {
  name = "dev-enablement.restore.customer-proposition.service-status.events.v3"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    "retention.ms"          = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "data_staged_events_finance_restore" {
  name               = "dev-enablement.restore.billing.DataStagedEventsFinance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # keep on each partition 750GiB
    "retention.bytes" = "805306368000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    "retention.ms"       = "-1" # keep data forever
    "cleanup.policy"     = "delete"
  }
}
