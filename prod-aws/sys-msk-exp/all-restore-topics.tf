resource "kafka_topic" "customer_support_vulnerability_v6" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms" = "126227808000"

    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.vulnerability_v6"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "customer_support_coffee_account_history_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 month
    "retention.ms" = "2629800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.coffee_account_history_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "customer_support_coffee_services" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 month
    "retention.ms" = "2629800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.coffee_services"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "customer_support_notes_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms" = "126227808000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.notes_v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "customer_support_ticketing_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms" = "126227808000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.ticketing_v2"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "customer_support_subscriptions_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Don't need tiered storage
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.subscriptions_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "customer_support_account_history_eqdb_notifications_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms" = "64800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.account_history_eqdb_notifications_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "customer_support_reminders_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms" = "126227808000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.reminders_v1"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "customer_support_reminders_notifications_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms" = "64800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.reminders_notifications_v1"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "customer_support_payments_audit_log_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 years
    "retention.ms" = "220898664000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "customer-support.payments_audit_log_v1"
  partitions         = 10
  replication_factor = 3
}

resource "kafka_topic" "energy_platform_gentrack_meter_read_events" {
  name               = "energy-platform.gentrack.meter.read.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_gentrack_billing_events" {
  name               = "energy-platform.gentrack.billing.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_gentrack_migration_events" {
  name               = "energy-platform.gentrack.migration.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_gentrack_market_interactions_events" {
  name               = "energy-platform.gentrack.market_interactions.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_gentrack_meterpoint_events" {
  name               = "energy-platform.gentrack.meterpoint.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_gentrack_electronic_payment_events" {
  name               = "energy-platform.gentrack.electronic_payment.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_meter_reads" {
  name               = "energy-platform.meter.read.events.v2"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 3 months
    "retention.ms" = "7889238000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_eqdb_loader_service" {
  name               = "energy-platform.eqdb-loader.service"
  replication_factor = 3
  partitions         = 1
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms" = "64800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_property_migration_events" {
  name               = "energy-platform.property.migration.events"
  replication_factor = 3
  partitions         = 15

  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_platform_tariff_events" {
  name               = "energy-platform.tariff.events"
  replication_factor = 3
  partitions         = 15
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628992000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "quoting_platform_basket_v1" {
  name               = "quoting-platform.basket.events.v1"
  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "account_identity_account_identity_account_events_v2" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.events.v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_insights_events_v4" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.insights.events.v4"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_atomic_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_unified_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.unified.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_public_account_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_management_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = -1 # keep data forever

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account-management-events-green"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_to_anonymize_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.to.anonymize"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_events_v3" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.events.v3"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_address_lookup_analytics_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_analytics_bill_change_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.analytics.bill.change.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_bill_writes_public" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.bill.writes.public"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_history_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.history.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_exceptions_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.exceptions.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_account_exceptions_events" {
  config = {
    "compression.type" = "zstd"
    "cleanup.policy"   = "compact"

    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.exceptions.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_land_registry_check_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.land-registry.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_correspondence_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_land_registry_check_events_test" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.land-registry.check.events.test"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_finserv_account_changed_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.account.change.events" # account-change-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_finserv_check_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.check.events" # check-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_finserv_check_status_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.check.status.events" # account-status-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "segment.ms"       = "604800000"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.events.compacted"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_changelog_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.changelog.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_change_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 1 hour
    "max.compaction.lag.ms"     = "3600000"
    "compression.type"          = "zstd"
    "min.cleanable.dirty.ratio" = "0.01"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.change.events.compacted"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_braze_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.braze.events.compacted"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_internal_legacy_account_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.internal.legacy.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_created_in_bill_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.created.in.bill.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_events_private" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.events.private"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_eqdb_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_staff_okta_v6" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_finance_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_verification" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
  name               = "account-identity.verification.events.v1"
  partitions         = 3
  replication_factor = 3
}

resource "kafka_topic" "account_identity_account_identity_legacy_account_holder_events_compacted" {
  name               = "account-identity.legacy.account.holder.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "compact"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_invoice_fulfillment" {
  name               = "bex.internal.bill_fulfilled"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_invoice_fulfillment_deadletter" {
  name               = "bex.internal.accountreadytobefulfilled_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_invoice_fulfilment_deadletter" {
  name               = "bex.internal.fulfilment_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 28 days
    "retention.ms" = "2419200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_mail_sender_deadletter" {
  name               = "bex.internal.mail_sender_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 28 days
    "retention.ms" = "2419200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_email_sender_deadletter" {
  name               = "bex.internal.email_sender_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 28 days
    "retention.ms" = "2419200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_mail_sender_reprint_deadletter" {
  name               = "bex.internal.mail_sender_reprint_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_invoice_generator" {
  name               = "bex.internal.invoices"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_invoice_ready_notifier_deadletter" {
  name               = "bex.internal.invoice_ready_notifier_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_bex_invoice_api" {
  name               = "bex.internal.bex_invoice_produced"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_bex_legacy_invoice_api" {
  name               = "bex.internal.exstream_invoice_produced"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_public_fulfilment_events" {
  name               = "bex.public.fulfilment_events"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep on each partition unlimited data
    "retention.bytes" = "-1"
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048588"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_transition_bex_fulfilment_request" {
  name               = "bex.transition.fulfilment_request"
  replication_factor = 3
  partitions         = 20
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
    # keep data for 14 days
    "retention.ms" = "1209600000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_fulfilment_retry_1" {
  name               = "bex.internal.fulfilment_retry_1"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_fulfilment_retry_2" {
  name               = "bex.internal.fulfilment_retry_2"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_fulfilment_large_invoice" {
  name               = "bex.internal.fulfilment_large_invoice"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_bill_regeneration" {
  name               = "bex.internal.bill_regeneration"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 14 days
    "retention.ms" = "1209600000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_bill_regeneration_retry_1" {
  name               = "bex.internal.bill_regeneration_retry_1"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_bill_regeneration_retry_2" {
  name               = "bex.internal.bill_regeneration_retry_2"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_bill_regeneration_large_invoice" {
  name               = "bex.internal.bill_regeneration_large_invoice"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_billing_internal_bex_bill_regeneration_deadletter" {
  name               = "bex.internal.bill_regeneration_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "ledgers_account_balance_events" {
  name               = "ledgers.account-balance.events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # TODO revisit
    # keep data for 1 year
    "retention.ms" = "31556952000"
    # delete old data
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "ledgers_transaction_events" {
  name               = "ledgers.transaction.events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # TODO revisit
    # keep data for 1 year
    "retention.ms" = "31556952000"
    # delete old data
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "ledgers_account_migrated_events" {
  name               = "ledgers.account.migrated.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # store data zstd compressed
    "compression.type" = "zstd"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_proposition_bundletier_events_compacted_v1" {
  name = "customer-proposition.public.bundletier.events.compacted.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "compact"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_proposition_bundletier_events_v1" {
  name = "customer-proposition.public.bundletier.events.v1"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_proposition_uswitch_data_v1" {
  name = "customer-proposition.uswitch.data.v1"

  replication_factor = 3
  partitions         = 15

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_proposition_uswitch_events_v2" {
  name = "customer-proposition.uswitch.events.v2"

  replication_factor = 3
  partitions         = 5

  # infinte retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_proposition_service_status_v4" {
  name = "customer-proposition.service-status.events.v4"

  replication_factor = 3
  partitions         = 15

  # infinite retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "customer_proposition_service_status_deadletter_v4" {
  name = "customer-proposition.service-status.events.deadletter.v4"

  replication_factor = 3
  partitions         = 1

  # infinite retention
  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1" # keep data forever
    # keep data in primary storage for 1 hour
    "local.retention.ms" = "3600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "help_and_support_self_serve_submissions" {
  name = "help-and-support.self_serve_submissions"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "help_and_support_self_serve_submissions_dlq" {
  name = "help-and-support.self_serve_submissions_dlq"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_e2e_proto" {
  name               = "data-infra.e2e.proto"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_e2e_json" {
  name               = "data-infra.e2e.json"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_e2e_multi" {
  name               = "data-infra.e2e.multi"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_e2e_multi_dpd" {
  name               = "data-infra.e2e.multi-dpd"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_e2e_non_std_envelope" {
  name               = "data-infra.e2e.non-std-envelope"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_snowplow" {
  name               = "data-infra.uw.data-infra.pubsubbrige.snowplow"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 5 days
    "retention.ms" = "432000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_events" {
  name               = "data-infra.uw.data-infra.product.v1.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_bill_event_bridge_dlq" {
  name               = "data-infra.bill_event_bridge.dlq"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_bill_integration_bill_telemetry" {
  name               = "data-infra.bill-integration.bill-telemetry"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "data_infra_bill_integration_bill_to_kubernetes" {
  name               = "data-infra.bill-integration.bill-to-kubernetes"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "data_infra_bill_integration_kubernetes_to_bill" {
  name               = "data-infra.bill-integration.kubernetes-to-bill"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "data_infra_bill_integration_kubernetes_to_bill_energy_meter_reading" {
  name               = "data-infra.bill-integration.kubernetes-to-bill-energy-meter-reading"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2628000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1.9MiB
    "max.message.bytes" = "2000012"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
    # Allow timestamps up to 10 years old
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "data_infra_events_end" {
  name               = "data-infra.uw.data-infra.product.v1.eventsend"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = "-1"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_dlq_requeue" {
  name               = "data-infra.product.v1.events.requeue"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_dlq" {
  name               = "data-infra.product.v1.events.dlq"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "data_infra_dlq_alerts" {
  name               = "data-infra.product.v1.events.dlq.alerts"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 3 days
    "retention.ms" = "259200001"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_fraud_events" {
  name = "cbc.FraudEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_data_product_events_v1" {
  name = "cbc.DataProductEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"         # keep on each partition unlimited data
    "retention.ms"          = "2629746000" # keep data for 1 month
    "local.retention.ms"    = "18000000"   # keep data in primary storage for 5 hours
    "max.message.bytes"     = "2097152"    # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_rating_events_v3" {
  name = "cbc.RatingEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_challenge_events_v1" {
  name = "cbc.ChallengeEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_charges_events_v1" {
  name = "cbc.ChargesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_lifecycle_events_v2" {
  name = "cbc.LifecycleEvents_v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_topup_events_v1" {
  name = "cbc.TopUpEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_topup_events_v1_deadletter" {
  name = "cbc.TopUpEventsDeadLetter"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"         # keep on each partition unlimited data
    "retention.ms"          = "2629800000" # keep data for 1 month
    "local.retention.ms"    = "3600000"    # keep data in primary storage for 1 hour
    "max.message.bytes"     = "2097152"    # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_payment_events_v1_deadletter" {
  name = "cbc.PaymentEventsDeadLetter"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"         # keep on each partition unlimited data
    "retention.ms"          = "2629800000" # keep data for 1 month
    "local.retention.ms"    = "3600000"    # keep data in primary storage for 1 hour
    "max.message.bytes"     = "2097152"    # allow for a batch of records maximum 2MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_transaction_events_v3" {
  name = "cbc.TransactionEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_openbanking_events_v1" {
  name = "cbc.OpenBankingEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_order_events_v1" {
  name = "cbc.OrderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_paymentology_events_v1" {
  name = "cbc.PaymentologyNotificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_sodexo_events_v1" {
  name = "cbc.SodexoEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_verification_events_v1" {
  name = "cbc.VerificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_customer_events_v1" {
  name = "cbc.CustomerEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_migration_events_v1" {
  name = "cbc.MigrationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_network_events_v1" {
  name = "cbc.NetworkEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_mdes_events_v1" {
  name = "cbc.MdesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_service_events_v1" {
  name = "cbc.ServiceEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_crm_events_v1" {
  name = "cbc.CrmEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_legacy_account_events_v2" {
  name = "cbc.legacy.account.events.v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "cbc_eqdb_loader_events_v1" {
  name = "cbc.EqdbLoaderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"       # keep data forever
    "local.retention.ms" = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"  = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "workplace_infrastructure_workplace_infrastructure_netapp_audit_v1_svm_cifs_a" {
  name               = "workplace-infrastructure.netapp-audit-v1.svm_cifs_a"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes"   = "209715200" # keep on each partition 200MiB
    "retention.ms"      = "86400000"  # keep data for 1 day
    "max.message.bytes" = "12288"     # allow for a batch of records maximum 12KiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "workplace_infrastructure_workplace_infrastructure_netapp_audit_v1_svm_cifs_b" {
  name               = "workplace-infrastructure.netapp-audit-v1.svm_cifs_b"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes"   = "209715200" # keep on each partition 200MiB
    "retention.ms"      = "86400000"  # keep data for 1 day
    "max.message.bytes" = "12288"     # allow for a batch of records maximum 12KiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_analysis_payment_method" {
  name               = "payment-platform.payment-analysis.payment-method"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_openbanking_v1_internal_payments" {
  name               = "payment-platform.openbanking.v1.internal.payments"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_openbanking_deadletter_v1_internal_payments" {
  name               = "payment-platform.openbanking-deadletter.v1.internal.payments"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_openbanking_v1_internal_payment_methods" {
  name               = "payment-platform.openbanking.v1.internal.payment-methods"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_openbanking_deadletter_v1_internal_payment_methods" {
  name               = "payment-platform.openbanking-deadletter.v1.internal.payment-methods"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_openbanking_v1_internal_settlements" {
  name               = "payment-platform.openbanking.v1.internal.settlements"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_openbanking_deadletter_v1_internal_settlements" {
  name               = "payment-platform.openbanking-deadletter.v1.internal.settlements"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_v1_events" {
  name               = "payment-platform.payment.v1.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_method_v1_events" {
  name               = "payment-platform.payment-method.v1.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_deadletter_v1_events" {
  name               = "payment-platform.payment-deadletter.v1.events"
  replication_factor = 3
  partitions         = 5 # we don't need more than 5 partitions for deadlettered events
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_method_deadletter_v1_events" {
  name               = "payment-platform.payment-method-deadletter.v1.events"
  replication_factor = 3
  partitions         = 5 # we don't need more than 5 partitions for deadlettered events
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_v1_public_events_pp_test" {
  name               = "payment-platform.payment.v1.public.events.pp_test"
  replication_factor = 3
  partitions         = 5 # this is a test/debug topic, not need to have more than 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_v1_public_events_cbc_topup_v3" {
  name               = "payment-platform.payment.v1.public.events.cbc_topup_v3"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_v1_public_events_debt" {
  name               = "payment-platform.payment.v1.public.events.debt"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_v1_public_events" {
  name               = "payment-platform.payment.v1.public.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_method_v1_public_events" {
  name               = "payment-platform.payment-method.v1.public.events"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_notifications_worldpay_raw" {
  name               = "payment-platform.notifications.worldpay.raw"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_notifications_stripe_raw" {
  name               = "payment-platform.notifications.stripe.raw"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_payment" {
  name               = "payment-platform.payment.payment"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_method_created" {
  name               = "payment-platform.payment.method-created"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_method_verified" {
  name               = "payment-platform.payment.method-verified"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_method_linked" {
  name               = "payment-platform.payment.method-linked"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_card_v1_internal" {
  name               = "payment-platform.card.v1.internal"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_card_deadletter_v1_internal" {
  name               = "payment-platform.card-deadletter.v1.internal"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_card_v1_internal_payment_methods" {
  name               = "payment-platform.card.v1.internal.payment-methods"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_card_deadletter_v1_internal_payment_methods" {
  name               = "payment-platform.card-deadletter.v1.internal.payment-methods"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_card_v1_internal_notifications" {
  name               = "payment-platform.card.v1.internal.notifications"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_enriched_txs" {
  name               = "payment-platform.payment.enriched-txs"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_gateway_reconciliation" {
  name               = "payment-platform.payment.gateway.reconciliation"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_gateway_reconciliation_status_changed" {
  name               = "payment-platform.payment.gateway.reconciliation.status-changed"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GiB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_payment_data_staged" {
  name               = "payment-platform.payment.data-staged"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "payment_platform_notifications_tx" {
  name               = "payment-platform.notifications.tx"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "iam_iam_cerbos_audit_v1" {
  name               = "auth.iam-cerbos-audit-v1"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "iam_iam_credentials_v1" {
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
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "iam_iam_dpd_v1" {
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
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "iam_iam_identitydb_v1" {
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
    "max.message.bytes" = "5242880"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "iam_iam_revoked_v1" {
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
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "iam_iam_credentials_v1_public" {
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
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "iam_iam_click_v2" {
  name               = "auth.iam-click-v2"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_billing_internal_energy_billing_billing_adapter_deadletter" {
  name               = "energy-billing.internal.billing-adapter-deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 28 days
    "retention.ms" = "2419200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_billing_internal_energy_billing_billing_adapter_retry_1" {
  name               = "energy-billing.internal.billing-adapter-retry-1"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_billing_internal_energy_billing_billing_adapter_retry_2" {
  name               = "energy-billing.internal.billing-adapter-retry-2"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "energy_billing_energy_billing_electronic_payment_events" {
  name               = "energy-billing.electronic_payment.events"
  replication_factor = 3
  partitions         = 5
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "finance_fabricator_sledger_entries_v1" {
  name               = "finance.fabricator.sledger.entries.v1"
  replication_factor = 3
  partitions         = 10
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
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "dev_enablement_connect_configs" {
  name               = "dev-enablement.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "dev_enablement_connect_offsets" {
  name               = "dev-enablement.connect-offsets"
  partitions         = 25
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "dev_enablement_connect_status" {
  name               = "dev-enablement.connect-status"
  partitions         = 5
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"


  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_public_policies_v1" {
  name = "insurance.public.policies.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_accounts_v1" {
  name = "insurance.private.accounts.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_accounts_v2" {
  name = "insurance.private.accounts.v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_claims_v1" {
  name = "insurance.private.claims.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_comms_v1" {
  name = "insurance.private.comms.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_coverage_v1" {
  name = "insurance.private.coverage.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_documents_v1" {
  name = "insurance.private.documents.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_durell_edi_v1" {
  name = "insurance.private.durell.edi.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_eligibility_v1" {
  name = "insurance.private.eligibility.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_renewal_dates_v1" {
  name = "insurance.private.renewal_dates.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_policies_v1" {
  name = "insurance.private.policies.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_policy_prices_v1" {
  name = "insurance.private.policy_prices.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "insurance_private_quotes_v1" {
  name = "insurance.private.quotes.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "billing_transactions_auditor_diff_events" {
  name               = "billing.transactions-auditor-diff.events"
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
    # keep data for 2 months
    "retention.ms"   = "5184000000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "billing_data_staged_events_finance" {
  name               = "billing.DataStagedEventsFinance"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # keep on each partition 25GiB
    "retention.bytes" = "26843545600"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    "retention.ms"       = "604800000" # keep data for 7 days
    "cleanup.policy"     = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "billing_historical_data_staged_events_finance" {
  name               = "billing.historical-data-staged-events-finance"
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
    # keep data for 7 days
    "retention.ms"   = "604800000"
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "billing_fixed_width_file_processing_events" {
  name               = "billing.fixed-width-file-processing-events"
  replication_factor = 3
  partitions         = 2
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "billing_bill_reconciliation_error_events" {
  name               = "billing.bill-reconciliation-error-events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "billing_unified_bill_ready_events" {
  name               = "billing.unified-bill-ready-events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "billing_billing_energy_raw_data_reconciliation_diff" {
  name               = "billing.energy-raw-data-reconciliation-diff"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # delete old data
    "cleanup.policy" = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_genesys_eb_events" {
  name = "contact-channels.genesys_eb_events"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_finished_conversations" {
  name = "contact-channels.finished_conversations"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # keep data for 1 day
    "max.message.bytes" = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_finished_transcriptions" {
  name = "contact-channels.finished_transcriptions"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # keep data for 1 day
    "max.message.bytes" = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_finished_segments" {
  name = "contact-channels.finished_segments"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_messenger_transcript_events" {
  name = "contact-channels.messenger_transcript_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_messenger_transcript_events_dlq" {
  name = "contact-channels.messenger_transcript_events_dlq"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_article_feedback_v1" {
  name = "contact-channels.article_feedback_v1"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_tracking_events" {
  name = "contact-channels.tracking_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_intents_v2" {
  name = "contact-channels.intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_validated_intents_v2" {
  name = "contact-channels.validated_intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_interactions_state_events" {
  name = "contact-channels.interactions_state_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # keep data for 1 day
    "max.message.bytes" = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_sent_agent_states" {
  name = "contact-channels.sent_agent_states"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # keep data for 1 day
    "max.message.bytes" = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_dsar" {
  name = "contact-channels.dsar"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_dsar_job" {
  name = "contact-channels.dsar_job"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_dsar_conversation" {
  name = "contact-channels.dsar_conversation"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "contact_channels_auto_email_drafts" {
  name = "contact-channels.auto_email_drafts"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_bill_events" {
  name               = "unicom.bill-events"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_bill_failed" {
  name               = "unicom.bill-failed"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_bounce_2019_1" {
  name               = "unicom.bounce.2019.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_caps" {
  name               = "unicom.caps"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_caps_consent" {
  name               = "unicom.caps-consent"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_failed" {
  name               = "unicom.failed"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_cancel_status_1" {
  name               = "unicom.cancel-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_cancellation_1" {
  name               = "unicom.cancellation.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_clx_report" {
  name               = "unicom.clx-report"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_comms_fallback_1" {
  name               = "unicom.comms-fallback.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_cost_calculated_1" {
  name               = "unicom.cost-calculated.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_email_batch_1" {
  name               = "unicom.email-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_email_post_delivery_1" {
  name               = "unicom.email-post-delivery.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_email_released_critical_1" {
  name               = "unicom.email-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_email_released_important_1" {
  name               = "unicom.email-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_email_released_1" {
  name               = "unicom.email-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_email_status_1" {
  name               = "unicom.email-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_push_notification_status_1" {
  name               = "unicom.push-notification-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_go_inspire_letter_status_1" {
  name               = "unicom.go-inspire-letter-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_batch_critical_1" {
  name               = "unicom.letter-batch-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_batch_important_1" {
  name               = "unicom.letter-batch-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_batch_1" {
  name               = "unicom.letter-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_released_critical_1" {
  name               = "unicom.letter-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_released_important_1" {
  name               = "unicom.letter-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_released_1" {
  name               = "unicom.letter-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_status_1" {
  name               = "unicom.letter-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_mparticle_output_integration" {
  name               = "unicom.mparticle-output-integration"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_orchestration_entity_1" {
  name               = "unicom.orchestration-entity.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_orchestration_rule_execution_1" {
  name               = "unicom.orchestration-rule-execution.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_outbound_call_request" {
  name               = "unicom.outbound-call-request"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_rejected" {
  name               = "unicom.rejected"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_rendered_1" {
  name               = "unicom.rendered.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_requests" {
  name               = "unicom.requests"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_scheduled_1" {
  name               = "unicom.scheduled.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_send_notification_1" {
  name               = "unicom.send-notification.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_sms_batch_1" {
  name               = "unicom.sms-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_sms_released_critical_1" {
  name               = "unicom.sms-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_sms_released_important_1" {
  name               = "unicom.sms-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_sms_released_1" {
  name               = "unicom.sms-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_sms_status_1" {
  name               = "unicom.sms-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_status" {
  name               = "unicom.status"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_status_bill_email_connector" {
  name               = "unicom.status-bill-email-connector"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_status_energy_smets1_notifier" {
  name               = "unicom.status-energy-smets1-notifier"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_status_finance_email_delivery_engine" {
  name               = "unicom.status-finance-email-delivery-engine"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_status_v2" {
  name               = "unicom.status-v2"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_tests" {
  name               = "unicom.tests"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_push_notification_released_1" {
  name               = "unicom.push-notification-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_letter_send_adare" {
  name               = "unicom.letter-send-adare"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_sftp_status" {
  name               = "unicom.sftp-status"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_comms_api_requests" {
  name               = "unicom.comms-api-requests"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}

resource "kafka_topic" "unicom_unicom_braze_backfill" {
  name               = "unicom.braze_backfill"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 6 months
    "retention.ms" = "15552000000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"

  "message.timestamp.difference.max.ms" = "9223372036854775807" }
}
