resource "kafka_topic" "invoice_fulfillment" {
  name               = "bex.internal.bill_fulfilled"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice_fulfillment_deadletter" {
  name               = "bex.internal.accountreadytobefulfilled_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "mail_sender_deadletter" {
  name               = "bex.internal.mail_sender_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice_generator" {
  name               = "bex.internal.invoices"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 100 MB for a message
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice_ready_notifier_deadletter" {
  name               = "bex.internal.invoice_ready_notifier_deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "bex_invoice_api" {
  name               = "bex.internal.bex_invoice_produced"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 100 MB for a message
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "bex_legacy_invoice_api" {
  name               = "bex.internal.exstream_invoice_produced"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data in hot storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 100 MB for a message
    "max.message.bytes" = "104857600"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
