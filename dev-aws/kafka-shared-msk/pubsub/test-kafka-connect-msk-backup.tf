# https://docs.confluent.io/platform/7.8/connect/references/allconfigs.html#distributed-worker-configuration
resource "kafka_topic" "test_msk_backup_connect_configs" {
  name               = "pubsub.test-msk-backup.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "test_msk_backup_connect_offsets" {
  name               = "pubsub.test-msk-backup.connect-offsets"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}

resource "kafka_topic" "test_msk_backup_connect_status" {
  name               = "pubsub.test-msk-backup.connect-status"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"   = "compact"
    "compression.type" = "zstd"

  }
}


resource "kafka_topic" "restore_meter_reads" {
  name               = "pubsub.restore-test.energy-platform.meter.read.events.v3"
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_account_identity_account_exceptions_v1" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.account.exceptions.v1"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_correspondence_address_debt_exception_check_events" {
  config = {
    "cleanup.policy" = "delete"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data forever
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"     = "-1"
    "compression.type" = "zstd"
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_legacy_account_events" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.legacy.account.events"
  partitions         = 50
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_legacy_account_braze_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.legacy.account.braze.events.compacted"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_internal_legacy_account_events" {
  config = {
    "cleanup.policy" = "compact"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    "compression.type"      = "zstd"
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.internal.legacy.account.events"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_staff_okta_v6" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "pubsub.restore-test.account-identity.staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}

resource "kafka_topic" "restore_account_identity_legacy_account_holder_events_compacted" {
  name               = "pubsub.restore-test.account-identity.legacy.account.holder.events.compacted"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    # allow not compacted keys maximum for 7 days
    "max.compaction.lag.ms" = "604800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "compact"
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_service_status_v3" {
  name = "pubsub.restore-test.customer-proposition.service-status.events.v3"

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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_service_status_v4" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_service_status_deadletter_v4" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_events" {
  name               = "pubsub.restore-test.data-infra.uw.data-infra.product.v1.events"
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_events_end" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_iam_credentials_v1" {
  name               = "pubsub.restore-test.auth-customer.iam-credentials-v1"
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_iam_identitydb_v1" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_fixed_width_file_processing_events" {
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_bill_reconciliation_error_events" {
  name               = "pubsub.restore-test.billing.bill-reconciliation-error-events"
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_billing_engine_events_bce_deadletter" {
  name               = "pubsub.restore-test.billing.billing-engine-events-bce-deadletter"
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
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}

resource "kafka_topic" "restore_unicom_tests" {
  name               = "pubsub.restore-test.unicom.tests"
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
    "max.message.bytes" = "536870912"
    # allow writing older messages
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
# https://docs.confluent.io/platform/7.8/connect/security.html#worker-acl-requirements

# Allow Kafka Connect full access to internal topics
module "test_kafka_connect_full_internal_topics" {
  source = "../../../modules/tls-app"
  produce_topics = [
    "pubsub.test-msk-backup.connect-configs",
    "pubsub.test-msk-backup.connect-offsets",
    "pubsub.test-msk-backup.connect-status",
    "pubsub.restore-test.energy-platform.meter.read.events.v3",
    "pubsub.restore-test.account-identity.account.exceptions.v1",
    "pubsub.restore-test.account-identity.supply.address.debt.exception.check.events",
    "pubsub.restore-test.account-identity.correspondence.address.exception.check.events",
    "pubsub.restore-test.account-identity.correspondence.address.debt.exception.check.events",
    "pubsub.restore-test.account-identity.legacy.account.events",
    "pubsub.restore-test.account-identity.legacy.account.braze.events.compacted",
    "pubsub.restore-test.account-identity.internal.legacy.account.events",
    "pubsub.restore-test.account-identity.staff.okta.v6",
    "pubsub.restore-test.account-identity.legacy.account.holder.events.compacted",
    "pubsub.restore-test.customer-proposition.service-status.events.v3",
    "pubsub.restore-test.customer-proposition.service-status.events.v4",
    "pubsub.restore-test.customer-proposition.service-status.events.deadletter.v4",
    "pubsub.restore-test.data-infra.uw.data-infra.product.v1.events",
    "pubsub.restore-test.data-infra.uw.data-infra.product.v1.eventsend",
    "pubsub.restore-test.auth-customer.iam-credentials-v1",
    "pubsub.restore-test.auth.iam-identitydb-v1",
    "pubsub.restore-test.billing.fixed-width-file-processing-events",
    "pubsub.restore-test.billing.bill-reconciliation-error-events",
    "pubsub.restore-test.billing.billing-engine-events-bce-deadletter",
    "pubsub.restore-test.unicom.tests"
  ]
  consume_groups = [
    "pubsub.test-msk-backup-kafka-connect",
    "pubsub.test-msk-backup-kafka-connect-worker-group",
    "pubsub.test-msk-backup-kafka-connect-debug",
    "pubsub.test-msk-backup-kafka-connect-cold",
    "pubsub.test-msk-backup-kafka-connect-hot"
  ]
  cert_common_name = "pubsub/test-msk-backup-kafka-connect"
}

resource "kafka_acl" "test_kafka_connect_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "test_kafka_connect_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

# Enable only when we need to restore
#
# resource "kafka_acl" "test_kafka_connect_write_topic_all" {
#   resource_name       = "*"
#   resource_type       = "Topic"
#   acl_principal       = "User:CN=pubsub/test-msk-backup-kafka-connect"
#   acl_host            = "*"
#   acl_operation       = "Write"
#   acl_permission_type = "Allow"
# }
