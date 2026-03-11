resource "kafka_topic" "restore_test_customer_support_vulnerability_v7" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 year
    "retention.ms"                        = "31557600000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.vulnerability_v7"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_coffee_account_history_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 month
    "retention.ms"                        = "2629800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.coffee_account_history_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_coffee_services" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 month
    "retention.ms"                        = "2629800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.coffee_services"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_notes_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 year
    "retention.ms"                        = "31557600000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.notes_v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_ticketing_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 year
    "retention.ms"                        = "31557600000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.ticketing_v2"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_subscriptions_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Don't need tiered storage
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms"                        = "86400000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.subscriptions_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_account_history_eqdb_notifications_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms"                        = "64800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.account_history_eqdb_notifications_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_reminders_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 year
    "retention.ms"                        = "31557600000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.reminders_v1"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_reminders_notifications_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms"                        = "64800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.reminders_notifications_v1"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_support_payments_audit_log_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 year
    "retention.ms"                        = "31557600000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.customer-support.payments_audit_log_v1"
  partitions         = 10
  replication_factor = 3
}

resource "kafka_topic" "restore_test_energy_platform_gentrack_meter_read_events" {
  name               = "pubsub.test-restore.energy-platform.gentrack.meter.read.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_gentrack_billing_events" {
  name               = "pubsub.test-restore.energy-platform.gentrack.billing.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_gentrack_migration_events" {
  name               = "pubsub.test-restore.energy-platform.gentrack.migration.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_gentrack_market_interactions_events" {
  name               = "pubsub.test-restore.energy-platform.gentrack.market_interactions.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_gentrack_meterpoint_events" {
  name               = "pubsub.test-restore.energy-platform.gentrack.meterpoint.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_gentrack_electronic_payment_events" {
  name               = "pubsub.test-restore.energy-platform.gentrack.electronic_payment.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_gentrack_prepayment_notifications_events" {
  name               = "pubsub.test-restore.energy-platform.gentrack.prepayment.notifications.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_meter_reads" {
  name               = "pubsub.test-restore.energy-platform.meter.read.events.v3"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_eqdb_loader_service" {
  name               = "pubsub.test-restore.energy-platform.eqdb-loader.service"
  replication_factor = 3
  partitions         = 1
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms"                        = "64800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_property_migration_events" {
  name               = "pubsub.test-restore.energy-platform.property.migration.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_platform_tariff_events" {
  name               = "pubsub.test-restore.energy-platform.tariff.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_quoting_platform_basket_v1" {
  name               = "pubsub.test-restore.quoting-platform.basket.events.v1"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_events_v2" {
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
  name               = "pubsub.test-restore.account-identity.account.events.v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_insights_events_v4" {
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
  name               = "pubsub.test-restore.account-identity.account.insights.events.v4"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_atomic_v1" {
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
  name               = "pubsub.test-restore.account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_unified_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.account.unified.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_dev_account_events_anonymized_v0" {
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "cleanup.policy"     = "delete"
    "compression.type"   = "zstd"
    # keep data for 3 days
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.dev.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_from_prod_account_events_anonymized_v0" {
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "cleanup.policy"     = "delete"
    "compression.type"   = "zstd"
    # keep data for 3 days
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.from-prod.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_public_account_events" {
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
  name               = "pubsub.test-restore.account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_management_events" {
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
  name               = "pubsub.test-restore.account-identity.account-management-events"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_to_anonymize_events" {
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
  name               = "pubsub.test-restore.account-identity.to.anonymize"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_bill_writes_public" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.account.bill.writes.public"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_history_v1" {
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
  name               = "pubsub.test-restore.account-identity.account.history.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_exceptions_v1" {
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
  name               = "pubsub.test-restore.account-identity.account.exceptions.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_account_exceptions_events" {
  config = {
    "compression.type" = "zstd"
    "cleanup.policy"   = "compact"

    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.account.exceptions.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_supply_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.supply.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_land_registry_check_events" {
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
  name               = "pubsub.test-restore.account-identity.land-registry.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_correspondence_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_finserv_account_changed_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.account.change.events" # account-change-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_finserv_check_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.check.events" # check-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_finserv_check_status_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.check.status.events" # account-status-events in finserv
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_public_pep_sanction_events_v2" {
  name = "pubsub.test-restore.account-identity.public.pep-sanction.events.v2"
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 12 hours
    "retention.ms"                        = "43200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_private_pep_sanction_events_v2" {
  name = "pubsub.test-restore.account-identity.private.pep-sanction.events.v2"
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "segment.ms"       = "604800000"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.legacy.account.events.compacted"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_changelog_events" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.legacy.account.changelog.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_events" {
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
  name               = "pubsub.test-restore.account-identity.legacy.account.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_change_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.legacy.account.change.events.compacted"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_braze_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.legacy.account.braze.events.compacted"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_internal_legacy_account_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.internal.legacy.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_created_in_bill_events" {
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
  name               = "pubsub.test-restore.account-identity.legacy.account.created.in.bill.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_events_private" {
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
  name               = "pubsub.test-restore.account-identity.legacy.account.events.private"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_eqdb_events" {
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "cleanup.policy"     = "delete"
    "compression.type"   = "zstd"
    # keep data for 3 days
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_staff_okta_v6" {
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
  name               = "pubsub.test-restore.account-identity.staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_finance_events_compacted" {
  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms"               = "604800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.test-restore.account-identity.finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_verification" {
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
  name               = "pubsub.test-restore.account-identity.verification.events.v1"
  partitions         = 3
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_identity_legacy_account_holder_events_compacted" {
  name               = "pubsub.test-restore.account-identity.legacy.account.holder.events.compacted"
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

resource "kafka_topic" "restore_test_account_identity_account_identity_address_lookup_analytics_v1" {
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
  name               = "pubsub.test-restore.account-identity.address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_customer_billing_invoice_fulfillment" {
  name               = "pubsub.test-restore.bex.internal.bill_fulfilled"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_invoice_fulfillment_deadletter" {
  name               = "pubsub.test-restore.bex.internal.accountreadytobefulfilled_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_invoice_fulfilment_deadletter" {
  name               = "pubsub.test-restore.bex.internal.fulfilment_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 28 days
    "retention.ms" = "2419200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_mail_sender_deadletter" {
  name               = "pubsub.test-restore.bex.internal.mail_sender_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_email_sender_deadletter" {
  name               = "pubsub.test-restore.bex.internal.email_sender_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_mail_sender_reprint_deadletter" {
  name               = "pubsub.test-restore.bex.internal.mail_sender_reprint_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_invoice_ready_notifier_deadletter" {
  name               = "pubsub.test-restore.bex.internal.invoice_ready_notifier_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_bex_legacy_invoice_api" {
  name               = "pubsub.test-restore.bex.internal.exstream_invoice_produced"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes"                   = "104857600"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_public_fulfilment_events" {
  name               = "pubsub.test-restore.bex.public.fulfilment_events"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048588"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_transition_bex_fulfilment_request" {
  name               = "pubsub.test-restore.bex.transition.fulfilment_request"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "max.message.bytes"  = "104857600" # allow for a batch of records maximum 100MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"
    # keep data for 7 days
    "retention.ms"                        = "604800000"
    "retention.bytes"                     = "1006632960" # keep on each partition 960MiB
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_fulfilment_retry_1" {
  name               = "pubsub.test-restore.bex.internal.fulfilment_retry_1"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_fulfilment_retry_2" {
  name               = "pubsub.test-restore.bex.internal.fulfilment_retry_2"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_fulfilment_large_invoice" {
  name               = "pubsub.test-restore.bex.internal.fulfilment_large_invoice"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_bill_regeneration" {
  name               = "pubsub.test-restore.bex.internal.bill_regeneration"
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
    "retention.ms"                        = "1209600000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_bill_regeneration_retry_1" {
  name               = "pubsub.test-restore.bex.internal.bill_regeneration_retry_1"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_bill_regeneration_retry_2" {
  name               = "pubsub.test-restore.bex.internal.bill_regeneration_retry_2"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_bill_regeneration_large_invoice" {
  name               = "pubsub.test-restore.bex.internal.bill_regeneration_large_invoice"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_billing_internal_bex_bill_regeneration_deadletter" {
  name               = "pubsub.test-restore.bex.internal.bill_regeneration_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_ledgers_account_balance_events" {
  name               = "pubsub.test-restore.ledgers.account-balance.events"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_ledgers_transaction_events" {
  name               = "pubsub.test-restore.ledgers.transaction.events"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_ledgers_account_migrated_events" {
  name               = "pubsub.test-restore.ledgers.account.migrated.events"
  replication_factor = 3
  partitions         = 10
  config = {
    # store data zstd compressed
    "compression.type" = "zstd"
    # keep data for 0.5 hours
    "retention.ms" = "1800000"
    # delete old data
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_bundletier_events_compacted_v1" {
  name = "pubsub.test-restore.customer-proposition.public.bundletier.events.compacted.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "compact"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_bundletier_events_v1" {
  name = "pubsub.test-restore.customer-proposition.public.bundletier.events.v1"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_bundletier_events_compacted_v2" {
  name = "pubsub.test-restore.customer-proposition.public.bundletier.events.compacted.v2"

  replication_factor = 3
  partitions         = 15

  config = {
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "compact"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_bundletier_events_v2" {
  name = "pubsub.test-restore.customer-proposition.public.bundletier.events.v2"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_uswitch_data_v1" {
  name = "pubsub.test-restore.customer-proposition.uswitch.data.v1"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_uswitch_events_v2" {
  name = "pubsub.test-restore.customer-proposition.uswitch.events.v2"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_service_status_v3" {
  name = "pubsub.test-restore.customer-proposition.service-status.events.v3"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_service_status_v4" {
  name = "pubsub.test-restore.customer-proposition.service-status.events.v4"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_customer_proposition_service_status_deadletter_v4" {
  name = "pubsub.test-restore.customer-proposition.service-status.events.deadletter.v4"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_help_and_support_self_serve_submissions" {
  name = "pubsub.test-restore.help-and-support.self_serve_submissions"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_help_and_support_self_serve_submissions_dlq" {
  name = "pubsub.test-restore.help-and-support.self_serve_submissions_dlq"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_e2e_proto" {
  name               = "pubsub.test-restore.data-infra.e2e.proto"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_e2e_json" {
  name               = "pubsub.test-restore.data-infra.e2e.json"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_e2e_multi" {
  name               = "pubsub.test-restore.data-infra.e2e.multi"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_e2e_multi_dpd" {
  name               = "pubsub.test-restore.data-infra.e2e.multi-dpd"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_e2e_non_std_envelope" {
  name               = "pubsub.test-restore.data-infra.e2e.non-std-envelope"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_e2e_multi_project" {
  name               = "pubsub.test-restore.data-infra.e2e.multi_project"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_snowplow" {
  name               = "pubsub.test-restore.data-infra.uw.data-infra.pubsubbrige.snowplow"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    # keep data for 5 days
    "retention.ms" = "432000000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_test_pla1275" {
  name               = "pubsub.test-restore.data-infra.uw.data-infra.test.pla1275"
  replication_factor = 3
  partitions         = 1
  config = {
    # this is a test, and we need minimum and non-durable resources
    "remote.storage.enable" = "false"
    # keep data for 1 day
    "retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_events" {
  name               = "pubsub.test-restore.data-infra.uw.data-infra.product.v1.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_bill_event_bridge_dlq" {
  name               = "pubsub.test-restore.data-infra.bill_event_bridge.dlq"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_bill_integration_bill_telemetry" {
  name               = "pubsub.test-restore.data-infra.bill-integration.bill-telemetry"
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

resource "kafka_topic" "restore_test_data_infra_bill_integration_bill_to_kubernetes" {
  name               = "pubsub.test-restore.data-infra.bill-integration.bill-to-kubernetes"
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

resource "kafka_topic" "restore_test_data_infra_bill_integration_kubernetes_to_bill" {
  name               = "pubsub.test-restore.data-infra.bill-integration.kubernetes-to-bill"
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

resource "kafka_topic" "restore_test_data_infra_bill_integration_kubernetes_to_bill_energy_meter_reading" {
  name               = "pubsub.test-restore.data-infra.bill-integration.kubernetes-to-bill-energy-meter-reading"
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

resource "kafka_topic" "restore_test_data_infra_events_end" {
  name               = "pubsub.test-restore.data-infra.uw.data-infra.product.v1.eventsend"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_dlq_requeue" {
  name               = "pubsub.test-restore.data-infra.product.v1.events.requeue"
  replication_factor = 3
  partitions         = 1
  config = {

    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_dlq" {
  name               = "pubsub.test-restore.data-infra.product.v1.events.dlq"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2629800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_data_infra_dlq_alerts" {
  name               = "pubsub.test-restore.data-infra.product.v1.events.dlq.alerts"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data for 3 days
    "retention.ms" = "259200001"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_fraud_events" {
  name = "pubsub.test-restore.cbc.FraudEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_data_product_events_v1" {
  name = "pubsub.test-restore.cbc.DataProductEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable"               = "true"
    "retention.bytes"                     = "-1"         # keep on each partition unlimited data
    "retention.ms"                        = "2629746000" # keep data for 1 month
    "local.retention.ms"                  = "18000000"   # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"    # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_rating_events_v3" {
  name = "pubsub.test-restore.cbc.RatingEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_challenge_events_v1" {
  name = "pubsub.test-restore.cbc.ChallengeEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_charges_events_v1" {
  name = "pubsub.test-restore.cbc.ChargesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_lifecycle_events_v2" {
  name = "pubsub.test-restore.cbc.LifecycleEvents_v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_topup_events_v1" {
  name = "pubsub.test-restore.cbc.TopUpEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_transaction_events_v3" {
  name = "pubsub.test-restore.cbc.TransactionEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_openbanking_events_v1" {
  name = "pubsub.test-restore.cbc.OpenBankingEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_order_events_v1" {
  name = "pubsub.test-restore.cbc.OrderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_paymentology_events_v1" {
  name = "pubsub.test-restore.cbc.PaymentologyNotificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_sodexo_events_v1" {
  name = "pubsub.test-restore.cbc.SodexoEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_verification_events_v1" {
  name = "pubsub.test-restore.cbc.VerificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_customer_events_v1" {
  name = "pubsub.test-restore.cbc.CustomerEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_migration_events_v1" {
  name = "pubsub.test-restore.cbc.MigrationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_network_events_v1" {
  name = "pubsub.test-restore.cbc.NetworkEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_mdes_events_v1" {
  name = "pubsub.test-restore.cbc.MdesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_service_events_v1" {
  name = "pubsub.test-restore.cbc.ServiceEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_crm_events_v1" {
  name = "pubsub.test-restore.cbc.CrmEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_legacy_account_events_v2" {
  name = "pubsub.test-restore.cbc.legacy.account.events.v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_cbc_eqdb_loader_events_v1" {
  name = "pubsub.test-restore.cbc.EqdbLoaderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "2097152" # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_analysis_payment_method" {
  name               = "pubsub.test-restore.payment-platform.payment-analysis.payment-method"
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
    "retention.ms"                        = "31557600000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_openbanking_v1_internal_payments" {
  name               = "pubsub.test-restore.payment-platform.openbanking.v1.internal.payments"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_openbanking_deadletter_v1_internal_payments" {
  name               = "pubsub.test-restore.payment-platform.openbanking-deadletter.v1.internal.payments"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_openbanking_v1_internal_payment_methods" {
  name               = "pubsub.test-restore.payment-platform.openbanking.v1.internal.payment-methods"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_openbanking_deadletter_v1_internal_payment_methods" {
  name               = "pubsub.test-restore.payment-platform.openbanking-deadletter.v1.internal.payment-methods"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_openbanking_v1_internal_settlements" {
  name               = "pubsub.test-restore.payment-platform.openbanking.v1.internal.settlements"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_openbanking_deadletter_v1_internal_settlements" {
  name               = "pubsub.test-restore.payment-platform.openbanking-deadletter.v1.internal.settlements"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_v1_events" {
  name               = "pubsub.test-restore.payment-platform.payment.v1.events"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_method_v1_events" {
  name               = "pubsub.test-restore.payment-platform.payment-method.v1.events"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_deadletter_v1_events" {
  name               = "pubsub.test-restore.payment-platform.payment-deadletter.v1.events"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_method_deadletter_v1_events" {
  name               = "pubsub.test-restore.payment-platform.payment-method-deadletter.v1.events"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_v1_public_events_pp_test" {
  name               = "pubsub.test-restore.payment-platform.payment.v1.public.events.pp_test"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_v1_public_events_cbc_topup_v3" {
  name               = "pubsub.test-restore.payment-platform.payment.v1.public.events.cbc_topup_v3"
  replication_factor = 3
  partitions         = 5 # limiting it to only 5 partitions for dev, can be increased if necessary
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_v1_public_events_debt" {
  name               = "pubsub.test-restore.payment-platform.payment.v1.public.events.debt"
  replication_factor = 3
  partitions         = 5 # limiting it to only 5 partitions for dev, can be increased if necessary
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_v1_public_events_debt_payment_plan" {
  name               = "pubsub.test-restore.payment-platform.payment.v1.public.events.debt_payment_plan"
  replication_factor = 3
  partitions         = 5 # limiting it to only 5 partitions for dev, can be increased if necessary
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1" # keep on each partition unlimited data
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 month
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_v1_public_events" {
  name               = "pubsub.test-restore.payment-platform.payment.v1.public.events"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_method_v1_public_events" {
  name               = "pubsub.test-restore.payment-platform.payment-method.v1.public.events"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_notifications_worldpay_raw" {
  name               = "pubsub.test-restore.payment-platform.notifications.worldpay.raw"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_notifications_stripe_raw" {
  name               = "pubsub.test-restore.payment-platform.notifications.stripe.raw"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_payment" {
  name               = "pubsub.test-restore.payment-platform.payment.payment"
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
    "retention.ms"                        = "31557600000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_method_created" {
  name               = "pubsub.test-restore.payment-platform.payment.method-created"
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
    "retention.ms"                        = "31557600000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_method_verified" {
  name               = "pubsub.test-restore.payment-platform.payment.method-verified"
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
    "retention.ms"                        = "31557600000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_method_linked" {
  name               = "pubsub.test-restore.payment-platform.payment.method-linked"
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
    "retention.ms"                        = "31557600000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_card_v1_internal" {
  name               = "pubsub.test-restore.payment-platform.card.v1.internal"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_card_deadletter_v1_internal" {
  name               = "pubsub.test-restore.payment-platform.card-deadletter.v1.internal"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_card_v1_internal_payment_methods" {
  name               = "pubsub.test-restore.payment-platform.card.v1.internal.payment-methods"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_card_deadletter_v1_internal_payment_methods" {
  name               = "pubsub.test-restore.payment-platform.card-deadletter.v1.internal.payment-methods"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_card_v1_internal_notifications" {
  name               = "pubsub.test-restore.payment-platform.card.v1.internal.notifications"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_enriched_txs" {
  name               = "pubsub.test-restore.payment-platform.payment.enriched-txs"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_gateway_reconciliation" {
  name               = "pubsub.test-restore.payment-platform.payment.gateway.reconciliation"
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
    "retention.ms"                        = "31557600000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_gateway_reconciliation_status_changed" {
  name               = "pubsub.test-restore.payment-platform.payment.gateway.reconciliation.status-changed"
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
    "retention.ms"                        = "31557600000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_payment_data_staged" {
  name               = "pubsub.test-restore.payment-platform.payment.data-staged"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_payment_platform_notifications_tx" {
  name               = "pubsub.test-restore.payment-platform.notifications.tx"
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
    "retention.ms"                        = "2592000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_iam_iam_cerbos_audit_v1" {
  name               = "pubsub.test-restore.auth.iam-cerbos-audit-v1"
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

resource "kafka_topic" "restore_test_iam_iam_credentials_v1" {
  name               = "pubsub.test-restore.auth-customer.iam-credentials-v1"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_iam_iam_dpd_v1" {
  name               = "pubsub.test-restore.auth-customer.iam-dpd-v1"
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

resource "kafka_topic" "restore_test_iam_iam_identitydb_v1" {
  name               = "pubsub.test-restore.auth.iam-identitydb-v1"
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

resource "kafka_topic" "restore_test_iam_iam_revoked_v1" {
  name               = "pubsub.test-restore.auth.iam-revoked-v1"
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

resource "kafka_topic" "restore_test_iam_iam_credentials_v1_public" {
  name               = "pubsub.test-restore.auth-customer.iam-credentials-v1-public"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_iam_iam_click_v2" {
  name               = "pubsub.test-restore.auth.iam-click-v2"
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

resource "kafka_topic" "restore_test_energy_billing_internal_energy_billing_billing_adapter_deadletter" {
  name               = "pubsub.test-restore.energy-billing.internal.billing-adapter-deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 28 days
    "retention.ms" = "2419200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_billing_internal_energy_billing_billing_adapter_retry_1" {
  name               = "pubsub.test-restore.energy-billing.internal.billing-adapter-retry-1"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_billing_internal_energy_billing_billing_adapter_retry_2" {
  name               = "pubsub.test-restore.energy-billing.internal.billing-adapter-retry-2"
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
    "retention.ms"                        = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_energy_billing_energy_billing_electronic_payment_events" {
  name               = "pubsub.test-restore.energy-billing.electronic_payment.events"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_finance_fabricator_sledger_entries_v1" {
  name               = "pubsub.test-restore.finance.fabricator.sledger.entries.v1"
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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_dev_enablement_connect_configs" {
  name               = "pubsub.test-restore.dev-enablement.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"                      = "compact"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_dev_enablement_connect_offsets" {
  name               = "pubsub.test-restore.dev-enablement.connect-offsets"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"                      = "compact"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_dev_enablement_connect_status" {
  name               = "pubsub.test-restore.dev-enablement.connect-status"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"                      = "compact"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_insurance_public_policies_v1" {
  name = "pubsub.test-restore.insurance.public.policies.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_insurance_private_policies_v1" {
  name = "pubsub.test-restore.insurance.private.policies.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"      # keep data forever
    "local.retention.ms"                  = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"                   = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_iam_audit_ingest_v1" {
  name               = "pubsub.test-restore.iam-audit.ingest-v1"
  replication_factor = 3
  partitions         = 5
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2592000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_transactions_auditor_diff_events" {
  name               = "pubsub.test-restore.billing.transactions-auditor-diff.events"
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
    "retention.ms"                        = "5184000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_data_staged_events_finance" {
  name               = "pubsub.test-restore.billing.DataStagedEventsFinance"
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
    "local.retention.ms"                  = "172800000"
    "retention.ms"                        = "604800000" # keep data for 7 days
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_historical_data_staged_events_finance" {
  name               = "pubsub.test-restore.billing.historical-data-staged-events-finance"
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
    "retention.ms"                        = "604800000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_fixed_width_file_processing_events" {
  name               = "pubsub.test-restore.billing.fixed-width-file-processing-events"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_bill_reconciliation_error_events" {
  name               = "pubsub.test-restore.billing.bill-reconciliation-error-events"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_unified_bill_ready_events" {
  name               = "pubsub.test-restore.billing.unified-bill-ready-events"
  replication_factor = 3
  partitions         = 2
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_billing_engine_events_bce_deadletter" {
  name               = "pubsub.test-restore.billing.billing-engine-events-bce-deadletter"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_billing_billing_energy_raw_data_reconciliation_diff" {
  name               = "pubsub.test-restore.billing.energy-raw-data-reconciliation-diff"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_partner_commission_es_demo_v1" {
  name = "pubsub.test-restore.partner-commission.es.demo.v1"

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
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_genesys_eb_events" {
  name = "pubsub.test-restore.contact-channels.genesys_eb_events"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_finished_conversations" {
  name = "pubsub.test-restore.contact-channels.finished_conversations"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_finished_transcriptions" {
  name = "pubsub.test-restore.contact-channels.finished_transcriptions"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_finished_segments" {
  name = "pubsub.test-restore.contact-channels.finished_segments"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_messenger_transcript_events" {
  name = "pubsub.test-restore.contact-channels.messenger_transcript_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_messenger_transcript_events_dlq" {
  name = "pubsub.test-restore.contact-channels.messenger_transcript_events_dlq"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_article_feedback_v1" {
  name = "pubsub.test-restore.contact-channels.article_feedback_v1"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_tracking_events" {
  name = "pubsub.test-restore.contact-channels.tracking_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_intents_v2" {
  name = "pubsub.test-restore.contact-channels.intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_validated_intents_v2" {
  name = "pubsub.test-restore.contact-channels.validated_intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_interactions_state_events" {
  name = "pubsub.test-restore.contact-channels.interactions_state_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_sent_agent_states" {
  name = "pubsub.test-restore.contact-channels.sent_agent_states"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_dsar" {
  name = "pubsub.test-restore.contact-channels.dsar"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_dsar_job" {
  name = "pubsub.test-restore.contact-channels.dsar_job"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_contact_channels_dsar_conversation" {
  name = "pubsub.test-restore.contact-channels.dsar_conversation"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_staging_ept_transactions_auditor_diff_events" {
  name               = "pubsub.test-restore.staging-ept.transactions-auditor-diff.events"
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
    "retention.ms"                        = "5184000000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_staging_ept_data_staged_events_finance" {
  name               = "pubsub.test-restore.staging-ept.DataStagedEventsFinance"
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
    "local.retention.ms"                  = "172800000"
    "retention.ms"                        = "604800000" # keep data for 7 days
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_staging_ept_historical_data_staged_events_finance" {
  name               = "pubsub.test-restore.staging-ept.historical-data-staged-events-finance"
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
    "retention.ms"                        = "604800000"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_staging_ept_fixed_width_file_processing_events" {
  name               = "pubsub.test-restore.staging-ept.fixed-width-file-processing-events"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_staging_ept_bill_reconciliation_error_events" {
  name               = "pubsub.test-restore.staging-ept.bill-reconciliation-error-events"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_staging_ept_unified_bill_ready_events" {
  name               = "pubsub.test-restore.staging-ept.unified-bill-ready-events"
  replication_factor = 3
  partitions         = 2
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_staging_ept_billing_engine_events_bce_deadletter" {
  name               = "pubsub.test-restore.staging-ept.billing-engine-events-bce-deadletter"
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
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_bill_events" {
  name               = "pubsub.test-restore.unicom.bill-events"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_bill_failed" {
  name               = "pubsub.test-restore.unicom.bill-failed"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_bounce_2019_1" {
  name               = "pubsub.test-restore.unicom.bounce.2019.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_caps" {
  name               = "pubsub.test-restore.unicom.caps"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_caps_consent" {
  name               = "pubsub.test-restore.unicom.caps-consent"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_failed" {
  name               = "pubsub.test-restore.unicom.failed"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_cancel_status_1" {
  name               = "pubsub.test-restore.unicom.cancel-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_cancellation_1" {
  name               = "pubsub.test-restore.unicom.cancellation.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_clx_report" {
  name               = "pubsub.test-restore.unicom.clx-report"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_comms_fallback_1" {
  name               = "pubsub.test-restore.unicom.comms-fallback.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_cost_calculated_1" {
  name               = "pubsub.test-restore.unicom.cost-calculated.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_batch_1" {
  name               = "pubsub.test-restore.unicom.email-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_post_delivery_1" {
  name               = "pubsub.test-restore.unicom.email-post-delivery.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_critical_1" {
  name               = "pubsub.test-restore.unicom.email-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_important_1" {
  name               = "pubsub.test-restore.unicom.email-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_1" {
  name               = "pubsub.test-restore.unicom.email-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_mock_critical_1" {
  name               = "pubsub.test-restore.unicom.email-released-mock-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_mock_important_1" {
  name               = "pubsub.test-restore.unicom.email-released-mock-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_mock_1" {
  name               = "pubsub.test-restore.unicom.email-released-mock.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_ses_critical_1" {
  name               = "pubsub.test-restore.unicom.email-released-ses-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_ses_important_1" {
  name               = "pubsub.test-restore.unicom.email-released-ses-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_released_ses_1" {
  name               = "pubsub.test-restore.unicom.email-released-ses.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_email_status_1" {
  name               = "pubsub.test-restore.unicom.email-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_push_notification_status_1" {
  name               = "pubsub.test-restore.unicom.push-notification-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_go_inspire_letter_status_1" {
  name               = "pubsub.test-restore.unicom.go-inspire-letter-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_batch_critical_1" {
  name               = "pubsub.test-restore.unicom.letter-batch-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_batch_important_1" {
  name               = "pubsub.test-restore.unicom.letter-batch-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_batch_1" {
  name               = "pubsub.test-restore.unicom.letter-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_released_critical_1" {
  name               = "pubsub.test-restore.unicom.letter-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_released_important_1" {
  name               = "pubsub.test-restore.unicom.letter-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_released_1" {
  name               = "pubsub.test-restore.unicom.letter-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_released_mock_critical_1" {
  name               = "pubsub.test-restore.unicom.letter-released-mock-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_released_mock_important_1" {
  name               = "pubsub.test-restore.unicom.letter-released-mock-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_released_mock_1" {
  name               = "pubsub.test-restore.unicom.letter-released-mock.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_status_1" {
  name               = "pubsub.test-restore.unicom.letter-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_mparticle_output_integration" {
  name               = "pubsub.test-restore.unicom.mparticle-output-integration"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_orchestration_entity_1" {
  name               = "pubsub.test-restore.unicom.orchestration-entity.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_orchestration_rule_execution_1" {
  name               = "pubsub.test-restore.unicom.orchestration-rule-execution.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_outbound_call_request" {
  name               = "pubsub.test-restore.unicom.outbound-call-request"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_rejected" {
  name               = "pubsub.test-restore.unicom.rejected"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_rendered_1" {
  name               = "pubsub.test-restore.unicom.rendered.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_requests" {
  name               = "pubsub.test-restore.unicom.requests"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_scheduled_1" {
  name               = "pubsub.test-restore.unicom.scheduled.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_send_notification_1" {
  name               = "pubsub.test-restore.unicom.send-notification.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_sms_batch_1" {
  name               = "pubsub.test-restore.unicom.sms-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_sms_released_critical_1" {
  name               = "pubsub.test-restore.unicom.sms-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_sms_released_important_1" {
  name               = "pubsub.test-restore.unicom.sms-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_sms_released_1" {
  name               = "pubsub.test-restore.unicom.sms-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_sms_status_1" {
  name               = "pubsub.test-restore.unicom.sms-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_status" {
  name               = "pubsub.test-restore.unicom.status"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_status_bill_email_connector" {
  name               = "pubsub.test-restore.unicom.status-bill-email-connector"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_status_energy_smets1_notifier" {
  name               = "pubsub.test-restore.unicom.status-energy-smets1-notifier"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_status_finance_email_delivery_engine" {
  name               = "pubsub.test-restore.unicom.status-finance-email-delivery-engine"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_status_v2" {
  name               = "pubsub.test-restore.unicom.status-v2"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_tests" {
  name               = "pubsub.test-restore.unicom.tests"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_push_notification_released_1" {
  name               = "pubsub.test-restore.unicom.push-notification-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_letter_send_adare" {
  name               = "pubsub.test-restore.unicom.letter-send-adare"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_sftp_status" {
  name               = "pubsub.test-restore.unicom.sftp-status"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms"                  = "259200000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_comms_api_requests" {
  name               = "pubsub.test-restore.unicom.comms-api-requests"
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
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_test_unicom_unicom_braze_backfill" {
  name               = "pubsub.test-restore.unicom.braze_backfill"
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
    "max.message.bytes"                   = "536870912"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
