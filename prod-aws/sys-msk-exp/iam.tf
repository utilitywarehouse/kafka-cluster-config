resource "kafka_topic" "iam_click_v2" {
  name               = "auth.iam-click-v2"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "iam_cerbos_audit_v1" {
  name               = "auth.iam-cerbos-audit-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "iam_credentials_v1" {
  name               = "auth-customer.iam-credentials-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 months
    "retention.ms" = "5184000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "iam_dpd_v1" {
  name               = "auth-customer.iam-dpd-v1"
  replication_factor = 3
  partitions         = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "iam_identitydb_v1" {
  name               = "auth.iam-identitydb-v1"
  replication_factor = 3
  # MUST be 1 partition as identitydb assumes this to be true
  partitions = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 1 month
    "retention.ms" = "2592000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 5MiB
    "max.message.bytes"                   = "5242880"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "iam_revoked_v1" {
  name               = "auth.iam-revoked-v1"
  replication_factor = 3
  partitions         = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 months
    "retention.ms" = "5184000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "iam_credentials_v1_public" {
  name               = "auth-customer.iam-credentials-v1-public"
  replication_factor = 3
  partitions         = 10
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 months
    "retention.ms" = "5184000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
