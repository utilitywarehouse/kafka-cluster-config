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
