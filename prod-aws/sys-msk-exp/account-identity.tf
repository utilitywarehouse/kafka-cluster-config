resource "kafka_topic" "account_identity_account_events_v2" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms"                  = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.events.v2"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_atomic_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms"                  = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_unified_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.unified.events"
  partitions         = 50
  replication_factor = 3
}
resource "kafka_topic" "account_identity_public_account_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable"               = "true"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_management_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = -1 # keep data forever
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account-management-events-green"
  partitions         = 1
  replication_factor = 3
}
resource "kafka_topic" "account_identity_to_anonymize_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms"                        = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.to.anonymize"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_events_v3" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable"               = "true"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.events.v3"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_address_lookup_analytics_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable"               = "true"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_analytics_bill_change_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable"               = "true"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.analytics.bill.change.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_bill_writes_public" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.bill.writes.public"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_history_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms"                  = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.history.v1"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_exceptions_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.exceptions.v1"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_account_exceptions_events" {
  config = {
    "compression.type" = "zstd"
    "cleanup.policy"   = "compact"

    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.exceptions.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"                        = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"                        = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_land_registry_check_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.land-registry.check.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_correspondence_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"                        = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_land_registry_check_events_test" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable"               = "true"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.land-registry.check.events.test"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_finance_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "finserv_account_changed_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.account.change.events" # account-change-events in finserv
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "finserv_check_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.check.events" # check-events in finserv
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "finserv_check_status_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.check.status.events" # account-status-events in finserv
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_holder_events_compacted" {
  name               = "account-identity.legacy.account.holder.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048588"
    "cleanup.policy"                      = "compact"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "account_identity_legacy_account_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "segment.ms"       = "604800000"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.events.compacted"
  partitions         = 50
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_changelog_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.changelog.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms"                  = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.events"
  partitions         = 50
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_change_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 1 hour
    "max.compaction.lag.ms"               = "3600000"
    "compression.type"                    = "zstd"
    "min.cleanable.dirty.ratio"           = "0.01"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.change.events.compacted"
  partitions         = 50
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_braze_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.braze.events.compacted"
  partitions         = 50
  replication_factor = 3
}
resource "kafka_topic" "account_identity_internal_legacy_account_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.internal.legacy.account.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_created_in_bill_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms"                  = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.created.in.bill.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_events_private" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms"                  = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.events.private"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_legacy_account_eqdb_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms"                  = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_staff_okta_v6" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms"                  = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "account_identity_verification" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms"                        = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "account-identity.verification.events.v1"
  partitions         = 3
  replication_factor = 3
}
