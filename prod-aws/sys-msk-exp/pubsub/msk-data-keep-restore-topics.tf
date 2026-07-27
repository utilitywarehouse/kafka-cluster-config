################################################################
# Restore-test topics: copies of production topics under 50GB (excluding
# KAFKA_EXCLUDE_TOPICS_REGEX topics from msk-data-keep backup) prefixed with
# "pubsub.restore-test." so they can be used to test the restore process
# without touching the real production topics.
################################################################

resource "kafka_topic" "restore_test_account_identity_account_atomic_v1" {
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
  }
  name               = "pubsub.restore-test.account-identity.account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_events_v3" {
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

  }
  name               = "pubsub.restore-test.account-identity.account.events.v3"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_events_v2" {
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
  }
  name               = "pubsub.restore-test.account-identity.account.events.v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_exceptions_v1" {
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
  }
  name               = "pubsub.restore-test.account-identity.account.exceptions.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_history_v1" {
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
  }
  name               = "pubsub.restore-test.account-identity.account.history.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_management_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms" = -1 # keep data forever
  }
  name               = "pubsub.restore-test.account-identity.account-management-events-green"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_account_insights_events_v4" {
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
  }
  name               = "pubsub.restore-test.account-identity.account.insights.events.v4"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_address_lookup_analytics_v1" {
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

  }
  name               = "pubsub.restore-test.account-identity.address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_analytics_bill_change_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"

  }
  name               = "pubsub.restore-test.account-identity.analytics.bill.change.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_correspondence_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"
  }
  name               = "pubsub.restore-test.account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"
  }
  name               = "pubsub.restore-test.account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_home_move_lifecycle_events_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because this is a business event stream
    "retention.ms" = "-1"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
  }
  name               = "pubsub.restore-test.account-identity.home-move.lifecycle.events.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_land_registry_check_events" {
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
  }
  name               = "pubsub.restore-test.account-identity.land-registry.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_land_registry_check_events_test" {
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

  }
  name               = "pubsub.restore-test.account-identity.land-registry.check.events.test"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_legacy_account_created_in_bill_events" {
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
  }
  name               = "pubsub.restore-test.account-identity.legacy.account.created.in.bill.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_legacy_account_eqdb_events" {
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
  }
  name               = "pubsub.restore-test.account-identity.legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_legacy_account_events_private" {
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
  }
  name               = "pubsub.restore-test.account-identity.legacy.account.events.private"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_private_pep_sanction_events_v2" {
  name = "pubsub.restore-test.account-identity.private.pep-sanction.events.v2"
  config = {
    "remote.storage.enable" = "true"
    "cleanup.policy"        = "delete"
    "compression.type"      = "zstd"
    "retention.ms"          = "1209600000" # keep data for 14 days
    "local.retention.ms"    = "18000000"   # keep data in primary storage for 5 hours
  }
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_public_account_events" {
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

  }
  name               = "pubsub.restore-test.account-identity.public.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_public_pep_sanction_events_v2" {
  name = "pubsub.restore-test.account-identity.public.pep-sanction.events.v2"
  config = {
    "remote.storage.enable" = "true"
    "cleanup.policy"        = "delete"
    "compression.type"      = "zstd"
    "retention.ms"          = "2592000000" # keep data for 1 month
    "local.retention.ms"    = "18000000"   # keep data in primary storage for 5 hours
  }
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_staff_okta_v6" {
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
  }
  name               = "pubsub.restore-test.account-identity.staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms"     = "604800000"
    "compression.type" = "zstd"
  }
  name               = "pubsub.restore-test.account-identity.supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_to_anonymize_events" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "pubsub.restore-test.account-identity.to.anonymize"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_account_identity_verification" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "pubsub.restore-test.account-identity.verification.events.v1"
  partitions         = 3
  replication_factor = 3
}

resource "kafka_topic" "restore_test_iam_credentials_v1" {
  name               = "pubsub.restore-test.auth-customer.iam-credentials-v1"
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
  }
}

resource "kafka_topic" "restore_test_iam_credentials_v1_public" {
  name               = "pubsub.restore-test.auth-customer.iam-credentials-v1-public"
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
  }
}

resource "kafka_topic" "restore_test_iam_dpd_v1" {
  name               = "pubsub.restore-test.auth-customer.iam-dpd-v1"
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
  }
}

resource "kafka_topic" "restore_test_iam_identitydb_v1" {
  name               = "pubsub.restore-test.auth.iam-identitydb-v1"
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
  }
}

resource "kafka_topic" "restore_test_iam_revoked_v1" {
  name               = "pubsub.restore-test.auth.iam-revoked-v1"
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
  }
}

resource "kafka_topic" "restore_test_invoice_fulfillment_deadletter" {
  name               = "pubsub.restore-test.bex.internal.accountreadytobefulfilled_deadletter"
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
  }
}

resource "kafka_topic" "restore_test_invoice_fulfillment" {
  name               = "pubsub.restore-test.bex.internal.bill_fulfilled"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_bill_regeneration" {
  name               = "pubsub.restore-test.bex.internal.bill_regeneration"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_bill_regeneration_deadletter" {
  name               = "pubsub.restore-test.bex.internal.bill_regeneration_deadletter"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_bill_regeneration_large_invoice" {
  name               = "pubsub.restore-test.bex.internal.bill_regeneration_large_invoice"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_bill_regeneration_retry_1" {
  name               = "pubsub.restore-test.bex.internal.bill_regeneration_retry_1"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_bill_regeneration_retry_2" {
  name               = "pubsub.restore-test.bex.internal.bill_regeneration_retry_2"
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
  }
}

resource "kafka_topic" "restore_test_bex_invoice_api" {
  name               = "pubsub.restore-test.bex.internal.bex_invoice_produced"
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
  }
}

resource "kafka_topic" "restore_test_email_sender_deadletter" {
  name               = "pubsub.restore-test.bex.internal.email_sender_deadletter"
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
  }
}

resource "kafka_topic" "restore_test_bex_legacy_invoice_api" {
  name               = "pubsub.restore-test.bex.internal.exstream_invoice_produced"
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
  }
}

resource "kafka_topic" "restore_test_internal_invoice_fulfilment_deadletter" {
  name               = "pubsub.restore-test.bex.internal.fulfilment_deadletter"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_fulfilment_large_invoice" {
  name               = "pubsub.restore-test.bex.internal.fulfilment_large_invoice"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_fulfilment_retry_1" {
  name               = "pubsub.restore-test.bex.internal.fulfilment_retry_1"
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
  }
}

resource "kafka_topic" "restore_test_internal_bex_fulfilment_retry_2" {
  name               = "pubsub.restore-test.bex.internal.fulfilment_retry_2"
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
  }
}

resource "kafka_topic" "restore_test_invoice_ready_notifier_deadletter" {
  name               = "pubsub.restore-test.bex.internal.invoice_ready_notifier_deadletter"
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
  }
}

resource "kafka_topic" "restore_test_invoice_generator" {
  name               = "pubsub.restore-test.bex.internal.invoices"
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
  }
}

resource "kafka_topic" "restore_test_mail_sender_deadletter" {
  name               = "pubsub.restore-test.bex.internal.mail_sender_deadletter"
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
  }
}

resource "kafka_topic" "restore_test_mail_sender_reprint_deadletter" {
  name               = "pubsub.restore-test.bex.internal.mail_sender_reprint_deadletter"
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
  }
}

resource "kafka_topic" "restore_test_public_fulfilment_events" {
  name               = "pubsub.restore-test.bex.public.fulfilment_events"
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
  }
}

resource "kafka_topic" "restore_test_transition_bex_fulfilment_request" {
  name               = "pubsub.restore-test.bex.transition.fulfilment_request"
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
  }
}

resource "kafka_topic" "restore_test_billing_bill_core_model" {
  name               = "pubsub.restore-test.billing.bill-core-model"
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
    "retention.ms" = "2592000000"
    # delete old data
    "cleanup.policy" = "delete"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
  }
}

resource "kafka_topic" "restore_test_bill_reconciliation_error_events" {
  name               = "pubsub.restore-test.billing.bill-reconciliation-error-events"
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
  }
}

resource "kafka_topic" "restore_test_data_staged_events_finance" {
  name               = "pubsub.restore-test.billing.DataStagedEventsFinance"
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
  }
}

resource "kafka_topic" "restore_test_billing_energy_raw_data_reconciliation_diff" {
  name               = "pubsub.restore-test.billing.energy-raw-data-reconciliation-diff"
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
  }
}

resource "kafka_topic" "restore_test_fixed_width_file_processing_events" {
  name               = "pubsub.restore-test.billing.fixed-width-file-processing-events"
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
  }
}

resource "kafka_topic" "restore_test_historical_data_staged_events_finance" {
  name               = "pubsub.restore-test.billing.historical-data-staged-events-finance"
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
  }
}

resource "kafka_topic" "restore_test_billing_transaction_log_v3" {
  name               = "pubsub.restore-test.billing.transaction-log-v3"
  replication_factor = 3
  partitions         = 10
  config = {
    # use tiered storage
    "remote.storage.enable" = "true"
    # store data zstd compressed
    "compression.type" = "zstd"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1.1 months
    "retention.ms" = "2764800000"
    # making sure cleanup policy is not compaction 
    "cleanup.policy" = "delete"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
  }
}

resource "kafka_topic" "restore_test_transactions_auditor_diff_events" {
  name               = "pubsub.restore-test.billing.transactions-auditor-diff.events"
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
  }
}

resource "kafka_topic" "restore_test_unified_bill_ready_events" {
  name               = "pubsub.restore-test.billing.unified-bill-ready-events"
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
  }
}

resource "kafka_topic" "restore_test_billing_unified_bill_report_events" {
  name               = "pubsub.restore-test.billing.unified-bill-report-events"
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
    "retention.ms" = "2592000000"
    # delete old data
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "restore_test_challenge_events_v1" {
  name = "pubsub.restore-test.cbc.ChallengeEvents"

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
  }
}

resource "kafka_topic" "restore_test_charges_events_v1" {
  name = "pubsub.restore-test.cbc.ChargesEvents"

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
  }
}

resource "kafka_topic" "restore_test_crm_events_v1" {
  name = "pubsub.restore-test.cbc.CrmEvents"

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
  }
}

resource "kafka_topic" "restore_test_customer_events_v1" {
  name = "pubsub.restore-test.cbc.CustomerEvents"

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
  }
}

resource "kafka_topic" "restore_test_data_product_events_v1" {
  name = "pubsub.restore-test.cbc.DataProductEvents"

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
  }
}

resource "kafka_topic" "restore_test_eqdb_loader_events_v1" {
  name = "pubsub.restore-test.cbc.EqdbLoaderEvents"

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
  }
}

resource "kafka_topic" "restore_test_fraud_events" {
  name = "pubsub.restore-test.cbc.FraudEvents"

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
  }
}

resource "kafka_topic" "restore_test_lifecycle_events_v2" {
  name = "pubsub.restore-test.cbc.LifecycleEvents_v2"

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
  }
}

resource "kafka_topic" "restore_test_mdes_events_v1" {
  name = "pubsub.restore-test.cbc.MdesEvents"

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
  }
}

resource "kafka_topic" "restore_test_migration_events_v1" {
  name = "pubsub.restore-test.cbc.MigrationEvents"

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
  }
}

resource "kafka_topic" "restore_test_network_events_v1" {
  name = "pubsub.restore-test.cbc.NetworkEvents"

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
  }
}

resource "kafka_topic" "restore_test_openbanking_events_v1" {
  name = "pubsub.restore-test.cbc.OpenBankingEvents"

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
  }
}

resource "kafka_topic" "restore_test_order_events_v1" {
  name = "pubsub.restore-test.cbc.OrderEvents"

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
  }
}

resource "kafka_topic" "restore_test_payment_events_v1_deadletter" {
  name = "pubsub.restore-test.cbc.PaymentEventsDeadLetter"

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
  }
}

resource "kafka_topic" "restore_test_rating_events_v3" {
  name = "pubsub.restore-test.cbc.RatingEvents_v3"

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
  }
}

resource "kafka_topic" "restore_test_service_events_v1" {
  name = "pubsub.restore-test.cbc.ServiceEvents"

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
  }
}

resource "kafka_topic" "restore_test_sodexo_events_v1" {
  name = "pubsub.restore-test.cbc.SodexoEvents"

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
  }
}

resource "kafka_topic" "restore_test_topup_events_v1" {
  name = "pubsub.restore-test.cbc.TopUpEvents"

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
  }
}

resource "kafka_topic" "restore_test_topup_events_v1_deadletter" {
  name = "pubsub.restore-test.cbc.TopUpEventsDeadLetter"

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
  }
}

resource "kafka_topic" "restore_test_verification_events_v1" {
  name = "pubsub.restore-test.cbc.VerificationEvents"

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
  }
}

resource "kafka_topic" "restore_test_auto_email_drafts" {
  name = "pubsub.restore-test.contact-channels.auto_email_drafts"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "restore_test_dsar" {
  name = "pubsub.restore-test.contact-channels.dsar"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "restore_test_dsar_conversation" {
  name = "pubsub.restore-test.contact-channels.dsar_conversation"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "restore_test_dsar_job" {
  name = "pubsub.restore-test.contact-channels.dsar_job"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "restore_test_bundletier_events_v1" {
  name = "pubsub.restore-test.customer-proposition.public.bundletier.events.v1"

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
  }
}

resource "kafka_topic" "restore_test_bundletier_events_v2" {
  name = "pubsub.restore-test.customer-proposition.public.bundletier.events.v2"

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
  }
}

resource "kafka_topic" "restore_test_service_status_deadletter_v4" {
  name = "pubsub.restore-test.customer-proposition.service-status.events.deadletter.v4"

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
  }
}

resource "kafka_topic" "restore_test_service_status_v4" {
  name = "pubsub.restore-test.customer-proposition.service-status.events.v4"

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
  }
}

resource "kafka_topic" "restore_test_uswitch_data_v1" {
  name = "pubsub.restore-test.customer-proposition.uswitch.data.v1"

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
  }
}

resource "kafka_topic" "restore_test_uswitch_events_v2" {
  name = "pubsub.restore-test.customer-proposition.uswitch.events.v2"

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
  }
}

resource "kafka_topic" "restore_test_coffee_account_history_v1" {
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
  }
  name               = "pubsub.restore-test.customer-support.coffee_account_history_v1"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_coffee_services" {
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
  }
  name               = "pubsub.restore-test.customer-support.coffee_services"
  partitions         = 1
  replication_factor = 3
}

resource "kafka_topic" "restore_test_notes_v2" {
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
  }
  name               = "pubsub.restore-test.customer-support.notes_v2"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_payments_audit_log_v1" {
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
  }
  name               = "pubsub.restore-test.customer-support.payments_audit_log_v1"
  partitions         = 10
  replication_factor = 3
}

resource "kafka_topic" "restore_test_reminders_v1" {
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
  }
  name               = "pubsub.restore-test.customer-support.reminders_v1"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "restore_test_ticketing_v2" {
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
  }
  name               = "pubsub.restore-test.customer-support.ticketing_v2"
  partitions         = 5
  replication_factor = 3
}

resource "kafka_topic" "restore_test_vulnerability_v6" {
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
  }
  name               = "pubsub.restore-test.customer-support.vulnerability_v6"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_test_bill_integration_bill_telemetry" {
  name               = "pubsub.restore-test.data-infra.bill-integration.bill-telemetry"
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

resource "kafka_topic" "restore_test_bill_integration_bill_to_kubernetes" {
  name               = "pubsub.restore-test.data-infra.bill-integration.bill-to-kubernetes"
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

resource "kafka_topic" "restore_test_bill_integration_kubernetes_to_bill" {
  name               = "pubsub.restore-test.data-infra.bill-integration.kubernetes-to-bill"
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

resource "kafka_topic" "restore_test_bill_integration_kubernetes_to_bill_energy_meter_reading" {
  name               = "pubsub.restore-test.data-infra.bill-integration.kubernetes-to-bill-energy-meter-reading"
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

resource "kafka_topic" "restore_test_bill_event_bridge_dlq" {
  name               = "pubsub.restore-test.data-infra.bill_event_bridge.dlq"
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
  }
}

resource "kafka_topic" "restore_test_dlq" {
  name               = "pubsub.restore-test.data-infra.product.v1.events.dlq"
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
  }
}

resource "kafka_topic" "restore_test_dlq_alerts" {
  name               = "pubsub.restore-test.data-infra.product.v1.events.dlq.alerts"
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
  }
}

resource "kafka_topic" "restore_test_dlq_requeue" {
  name               = "pubsub.restore-test.data-infra.product.v1.events.requeue"
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
  }
}

resource "kafka_topic" "restore_test_events_end" {
  name               = "pubsub.restore-test.data-infra.uw.data-infra.product.v1.eventsend"
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
  }
}

resource "kafka_topic" "restore_test_energy_billing_electronic_payment_events" {
  name               = "pubsub.restore-test.energy-billing.electronic_payment.events"
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
  }
}

resource "kafka_topic" "restore_test_internal_energy_billing_billing_adapter_deadletter" {
  name               = "pubsub.restore-test.energy-billing.internal.billing-adapter-deadletter"
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
  }
}

resource "kafka_topic" "restore_test_internal_energy_billing_billing_adapter_retry_1" {
  name               = "pubsub.restore-test.energy-billing.internal.billing-adapter-retry-1"
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
  }
}

resource "kafka_topic" "restore_test_internal_energy_billing_billing_adapter_retry_2" {
  name               = "pubsub.restore-test.energy-billing.internal.billing-adapter-retry-2"
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
  }
}

resource "kafka_topic" "restore_test_flow_files_events" {
  name               = "pubsub.restore-test.energy-platform.flow-files.events"
  replication_factor = 3
  partitions         = 3
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 month
    "retention.ms" = "2592000000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "restore_test_gentrack_billing_events" {
  name               = "pubsub.restore-test.energy-platform.gentrack.billing.events"
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
  }
}

resource "kafka_topic" "restore_test_gentrack_electronic_payment_events" {
  name               = "pubsub.restore-test.energy-platform.gentrack.electronic_payment.events"
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
  }
}

resource "kafka_topic" "restore_test_gentrack_market_interactions_events" {
  name               = "pubsub.restore-test.energy-platform.gentrack.market_interactions.events"
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
  }
}

resource "kafka_topic" "restore_test_gentrack_meter_read_events" {
  name               = "pubsub.restore-test.energy-platform.gentrack.meter.read.events"
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
  }
}

resource "kafka_topic" "restore_test_gentrack_migration_events" {
  name               = "pubsub.restore-test.energy-platform.gentrack.migration.events"
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
  }
}

resource "kafka_topic" "restore_test_gentrack_meterpoint_events" {
  name               = "pubsub.restore-test.energy-platform.gentrack.meterpoint.events"
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
  }
}

resource "kafka_topic" "restore_test_gentrack_prepayment_events" {
  name               = "pubsub.restore-test.energy-platform.gentrack.prepayment.events"
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
  }
}

resource "kafka_topic" "restore_test_property_events" {
  name               = "pubsub.restore-test.energy-platform.property.events"
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
  }
}

resource "kafka_topic" "restore_test_property_migration_events" {
  name               = "pubsub.restore-test.energy-platform.property.migration.events"
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
  }
}

resource "kafka_topic" "restore_test_tariff_events" {
  name               = "pubsub.restore-test.energy-platform.tariff.events"
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
  }
}

resource "kafka_topic" "restore_test_fabricator_sledger_entries_v1" {
  name               = "pubsub.restore-test.finance.fabricator.sledger.entries.v1"
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
  }
}

resource "kafka_topic" "restore_test_self_serve_submissions" {
  name = "pubsub.restore-test.help-and-support.self_serve_submissions"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "restore_test_self_serve_submissions_dlq" {
  name = "pubsub.restore-test.help-and-support.self_serve_submissions_dlq"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "restore_test_private_accounts_v1" {
  name = "pubsub.restore-test.insurance.private.accounts.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_accounts_v2" {
  name = "pubsub.restore-test.insurance.private.accounts.v2"

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
  }
}

resource "kafka_topic" "restore_test_private_claims_v1" {
  name = "pubsub.restore-test.insurance.private.claims.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_comms_v1" {
  name = "pubsub.restore-test.insurance.private.comms.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_coverage_v1" {
  name = "pubsub.restore-test.insurance.private.coverage.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_documents_v1" {
  name = "pubsub.restore-test.insurance.private.documents.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_durell_edi_v1" {
  name = "pubsub.restore-test.insurance.private.durell.edi.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_eligibility_v1" {
  name = "pubsub.restore-test.insurance.private.eligibility.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_policy_prices_v1" {
  name = "pubsub.restore-test.insurance.private.policy_prices.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_policies_v1" {
  name = "pubsub.restore-test.insurance.private.policies.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_quotes_v1" {
  name = "pubsub.restore-test.insurance.private.quotes.v1"

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
  }
}

resource "kafka_topic" "restore_test_private_renewal_dates_v1" {
  name = "pubsub.restore-test.insurance.private.renewal_dates.v1"

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
  }
}

resource "kafka_topic" "restore_test_public_policies_v1" {
  name = "pubsub.restore-test.insurance.public.policies.v1"

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
  }
}

resource "kafka_topic" "restore_test_account_balance_events" {
  name               = "pubsub.restore-test.ledgers.account-balance.events"
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
  }
}

resource "kafka_topic" "restore_test_account_migrated_events" {
  name               = "pubsub.restore-test.ledgers.account.migrated.events"
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
  }
}

resource "kafka_topic" "restore_test_ledger_data_migration_events" {
  name               = "pubsub.restore-test.ledgers.data-migration.events"
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
  }
}

resource "kafka_topic" "restore_test_ledger_reconciliation_events" {
  name               = "pubsub.restore-test.ledgers.reconciliation.events"
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
  }
}

resource "kafka_topic" "restore_test_transaction_events" {
  name               = "pubsub.restore-test.ledgers.transaction.events"
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
  }
}

resource "kafka_topic" "restore_test_card_deadletter_v1_internal" {
  name               = "pubsub.restore-test.payment-platform.card-deadletter.v1.internal"
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
  }
}

resource "kafka_topic" "restore_test_card_deadletter_v1_internal_payment_methods" {
  name               = "pubsub.restore-test.payment-platform.card-deadletter.v1.internal.payment-methods"
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
  }
}

resource "kafka_topic" "restore_test_card_v1_internal" {
  name               = "pubsub.restore-test.payment-platform.card.v1.internal"
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
  }
}

resource "kafka_topic" "restore_test_card_v1_internal_notifications" {
  name               = "pubsub.restore-test.payment-platform.card.v1.internal.notifications"
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
  }
}

resource "kafka_topic" "restore_test_card_v1_internal_payment_methods" {
  name               = "pubsub.restore-test.payment-platform.card.v1.internal.payment-methods"
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
  }
}

resource "kafka_topic" "restore_test_notifications_stripe_raw" {
  name               = "pubsub.restore-test.payment-platform.notifications.stripe.raw"
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
  }
}

resource "kafka_topic" "restore_test_notifications_tx" {
  name               = "pubsub.restore-test.payment-platform.notifications.tx"
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
  }
}

resource "kafka_topic" "restore_test_notifications_worldpay_raw" {
  name               = "pubsub.restore-test.payment-platform.notifications.worldpay.raw"
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
  }
}

resource "kafka_topic" "restore_test_openbanking_deadletter_v1_internal_payment_methods" {
  name               = "pubsub.restore-test.payment-platform.openbanking-deadletter.v1.internal.payment-methods"
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
  }
}

resource "kafka_topic" "restore_test_openbanking_deadletter_v1_internal_payments" {
  name               = "pubsub.restore-test.payment-platform.openbanking-deadletter.v1.internal.payments"
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
  }
}

resource "kafka_topic" "restore_test_openbanking_deadletter_v1_internal_settlements" {
  name               = "pubsub.restore-test.payment-platform.openbanking-deadletter.v1.internal.settlements"
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
  }
}

resource "kafka_topic" "restore_test_openbanking_v1_internal_payment_methods" {
  name               = "pubsub.restore-test.payment-platform.openbanking.v1.internal.payment-methods"
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
  }
}

resource "kafka_topic" "restore_test_openbanking_v1_internal_payments" {
  name               = "pubsub.restore-test.payment-platform.openbanking.v1.internal.payments"
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
  }
}

resource "kafka_topic" "restore_test_openbanking_v1_internal_settlements" {
  name               = "pubsub.restore-test.payment-platform.openbanking.v1.internal.settlements"
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
  }
}

resource "kafka_topic" "restore_test_payment_analysis_payment_method" {
  name               = "pubsub.restore-test.payment-platform.payment-analysis.payment-method"
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
  }
}

resource "kafka_topic" "restore_test_payment_deadletter_v1_events" {
  name               = "pubsub.restore-test.payment-platform.payment-deadletter.v1.events"
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
  }
}

resource "kafka_topic" "restore_test_payment_method_deadletter_v1_events" {
  name               = "pubsub.restore-test.payment-platform.payment-method-deadletter.v1.events"
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
  }
}

resource "kafka_topic" "restore_test_payment_method_v1_events" {
  name               = "pubsub.restore-test.payment-platform.payment-method.v1.events"
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
  }
}

resource "kafka_topic" "restore_test_payment_method_v1_public_events" {
  name               = "pubsub.restore-test.payment-platform.payment-method.v1.public.events"
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
  }
}

resource "kafka_topic" "restore_test_payment_data_staged" {
  name               = "pubsub.restore-test.payment-platform.payment.data-staged"
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
  }
}

resource "kafka_topic" "restore_test_payment_enriched_txs" {
  name               = "pubsub.restore-test.payment-platform.payment.enriched-txs"
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
  }
}

resource "kafka_topic" "restore_test_payment_gateway_reconciliation" {
  name               = "pubsub.restore-test.payment-platform.payment.gateway.reconciliation"
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
  }
}

resource "kafka_topic" "restore_test_payment_gateway_reconciliation_status_changed" {
  name               = "pubsub.restore-test.payment-platform.payment.gateway.reconciliation.status-changed"
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
  }
}

resource "kafka_topic" "restore_test_payment_method_created" {
  name               = "pubsub.restore-test.payment-platform.payment.method-created"
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
  }
}

resource "kafka_topic" "restore_test_payment_method_linked" {
  name               = "pubsub.restore-test.payment-platform.payment.method-linked"
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
  }
}

resource "kafka_topic" "restore_test_payment_method_verified" {
  name               = "pubsub.restore-test.payment-platform.payment.method-verified"
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
  }
}

resource "kafka_topic" "restore_test_payment_payment" {
  name               = "pubsub.restore-test.payment-platform.payment.payment"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_events" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.events"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_public_events" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.public.events"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_public_events_cbc_topup_v3" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.public.events.cbc_topup_v3"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_public_events_debt" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.public.events.debt"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_public_events_debt_payment_plan" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.public.events.debt_payment_plan"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_public_events_due_bill_payment" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.public.events.due_bill_payment"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_public_events_overdue_debt_logged_in" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.public.events.overdue_debt_logged_in"
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
  }
}

resource "kafka_topic" "restore_test_payment_v1_public_events_pp_test" {
  name               = "pubsub.restore-test.payment-platform.payment.v1.public.events.pp_test"
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
  }
}

resource "kafka_topic" "restore_test_basket_v1" {
  name               = "pubsub.restore-test.quoting-platform.basket.events.v1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_bill_events" {
  name               = "pubsub.restore-test.unicom.bill-events"
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
  }
}

resource "kafka_topic" "restore_test_unicom_bill_failed" {
  name               = "pubsub.restore-test.unicom.bill-failed"
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
  }
}

resource "kafka_topic" "restore_test_unicom_bounce_2019_1" {
  name               = "pubsub.restore-test.unicom.bounce.2019.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_braze_backfill" {
  name               = "pubsub.restore-test.unicom.braze_backfill"
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
  }
}

resource "kafka_topic" "restore_test_unicom_cancellation_1" {
  name               = "pubsub.restore-test.unicom.cancellation.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_caps" {
  name               = "pubsub.restore-test.unicom.caps"
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
  }
}

resource "kafka_topic" "restore_test_unicom_caps_consent" {
  name               = "pubsub.restore-test.unicom.caps-consent"
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
  }
}

resource "kafka_topic" "restore_test_unicom_clx_report" {
  name               = "pubsub.restore-test.unicom.clx-report"
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
  }
}

resource "kafka_topic" "restore_test_unicom_comms_api_requests" {
  name               = "pubsub.restore-test.unicom.comms-api-requests"
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
  }
}

resource "kafka_topic" "restore_test_unicom_comms_fallback_1" {
  name               = "pubsub.restore-test.unicom.comms-fallback.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_cost_calculated_1" {
  name               = "pubsub.restore-test.unicom.cost-calculated.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_di_kafka_source_notification" {
  name               = "pubsub.restore-test.unicom.di-kafka-source-notification"
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
  }
}

resource "kafka_topic" "restore_test_unicom_email_batch_1" {
  name               = "pubsub.restore-test.unicom.email-batch.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_email_post_delivery_1" {
  name               = "pubsub.restore-test.unicom.email-post-delivery.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_email_released_1" {
  name               = "pubsub.restore-test.unicom.email-released.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_email_released_critical_1" {
  name               = "pubsub.restore-test.unicom.email-released-critical.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_email_released_important_1" {
  name               = "pubsub.restore-test.unicom.email-released-important.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_email_status_1" {
  name               = "pubsub.restore-test.unicom.email-status.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_failed" {
  name               = "pubsub.restore-test.unicom.failed"
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
  }
}

resource "kafka_topic" "restore_test_unicom_go_inspire_letter_status_1" {
  name               = "pubsub.restore-test.unicom.go-inspire-letter-status.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_batch_1" {
  name               = "pubsub.restore-test.unicom.letter-batch.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_batch_critical_1" {
  name               = "pubsub.restore-test.unicom.letter-batch-critical.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_batch_important_1" {
  name               = "pubsub.restore-test.unicom.letter-batch-important.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_released_1" {
  name               = "pubsub.restore-test.unicom.letter-released.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_released_critical_1" {
  name               = "pubsub.restore-test.unicom.letter-released-critical.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_released_important_1" {
  name               = "pubsub.restore-test.unicom.letter-released-important.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_send_adare" {
  name               = "pubsub.restore-test.unicom.letter-send-adare"
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
  }
}

resource "kafka_topic" "restore_test_unicom_letter_status_1" {
  name               = "pubsub.restore-test.unicom.letter-status.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_mparticle_output_integration" {
  name               = "pubsub.restore-test.unicom.mparticle-output-integration"
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
  }
}

resource "kafka_topic" "restore_test_unicom_orchestration_entity_1" {
  name               = "pubsub.restore-test.unicom.orchestration-entity.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_orchestration_rule_execution_1" {
  name               = "pubsub.restore-test.unicom.orchestration-rule-execution.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_outbound_call_request" {
  name               = "pubsub.restore-test.unicom.outbound-call-request"
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
  }
}

resource "kafka_topic" "restore_test_unicom_push_notification_released_1" {
  name               = "pubsub.restore-test.unicom.push-notification-released.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_push_notification_status_1" {
  name               = "pubsub.restore-test.unicom.push-notification-status.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_rejected" {
  name               = "pubsub.restore-test.unicom.rejected"
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
  }
}

resource "kafka_topic" "restore_test_unicom_rendered_1" {
  name               = "pubsub.restore-test.unicom.rendered.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_requests" {
  name               = "pubsub.restore-test.unicom.requests"
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
  }
}

resource "kafka_topic" "restore_test_unicom_scheduled_1" {
  name               = "pubsub.restore-test.unicom.scheduled.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_send_notification_1" {
  name               = "pubsub.restore-test.unicom.send-notification.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_sftp_status" {
  name               = "pubsub.restore-test.unicom.sftp-status"
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
  }
}

resource "kafka_topic" "restore_test_unicom_sms_batch_1" {
  name               = "pubsub.restore-test.unicom.sms-batch.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_sms_released_1" {
  name               = "pubsub.restore-test.unicom.sms-released.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_sms_released_critical_1" {
  name               = "pubsub.restore-test.unicom.sms-released-critical.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_sms_released_important_1" {
  name               = "pubsub.restore-test.unicom.sms-released-important.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_sms_status_1" {
  name               = "pubsub.restore-test.unicom.sms-status.1"
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
  }
}

resource "kafka_topic" "restore_test_unicom_status_bill_email_connector" {
  name               = "pubsub.restore-test.unicom.status-bill-email-connector"
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
  }
}

resource "kafka_topic" "restore_test_unicom_status_energy_smets1_notifier" {
  name               = "pubsub.restore-test.unicom.status-energy-smets1-notifier"
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
  }
}

resource "kafka_topic" "restore_test_unicom_status_finance_email_delivery_engine" {
  name               = "pubsub.restore-test.unicom.status-finance-email-delivery-engine"
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
  }
}
