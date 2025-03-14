resource "kafka_topic" "invoice_fulfillment" {
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
  }
}

resource "kafka_topic" "invoice_fulfillment_deadletter" {
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
  }
}

resource "kafka_topic" "internal_invoice_fulfilment_deadletter" {
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
  }
}

resource "kafka_topic" "mail_sender_deadletter" {
  name               = "bex.internal.mail_sender_deadletter"
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

resource "kafka_topic" "email_sender_deadletter" {
  name               = "bex.internal.email_sender_deadletter"
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

resource "kafka_topic" "mail_sender_reprint_deadletter" {
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
  }
}

resource "kafka_topic" "invoice_generator" {
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
  }
}

resource "kafka_topic" "invoice_ready_notifier_deadletter" {
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
  }
}

resource "kafka_topic" "bex_invoice_api" {
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
  }
}

resource "kafka_topic" "bex_legacy_invoice_api" {
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
  }
}

resource "kafka_topic" "public_fulfilment_events" {
  name               = "bex.public.fulfilment_events"
  replication_factor = 3
  partitions         = 10
  config = {
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048588"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# this topic is used during the transition from exstream to bex bill
# generation and contains AccountReadyToBeFulfilledEvents
resource "kafka_topic" "transition_bex_fulfilment_request" {
  name               = "bex.transition.fulfilment_request"
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
    "retention.ms"    = "604800000"
    "retention.bytes" = "1006632960" # keep on each partition 960MiB
  }
}

# this topic is used in the bill generation pipeline
# used for retrying the bill generation on failure
resource "kafka_topic" "internal_bex_fulfilment_retry_1" {
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
  }
}

# this topic is used in the bill generation pipeline
# used for retrying the bill generation on failure
resource "kafka_topic" "internal_bex_fulfilment_retry_2" {
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
  }
}

# this topic is used in the bill generation pipeline
# used for processing print invoices
resource "kafka_topic" "internal_bex_fulfilment_print" {
  name               = "bex.internal.fulfilment_print"
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

# this topic is used in the bill generation pipeline
# used for processing large invoices
resource "kafka_topic" "internal_bex_fulfilment_large_invoice" {
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
  }
}

# this topic is used in the bill regeneration pipeline
resource "kafka_topic" "internal_bex_bill_regeneration" {
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
  }
}

# this topic is used in the bill regeneration pipeline
# used for retrying the bill regeneration on failure
resource "kafka_topic" "internal_bex_bill_regeneration_retry_1" {
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
  }
}

# this topic is used in the bill regeneration pipeline
# used for retrying the bill regeneration on failure
resource "kafka_topic" "internal_bex_bill_regeneration_retry_2" {
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
  }
}

# this topic is used in the bill regeneration pipeline
# used for processing print invoices
resource "kafka_topic" "internal_bex_bill_regeneration_print" {
  name               = "bex.internal.bill_regeneration_print"
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

# this topic is used in the bill regeneration pipeline
# used for processing large invoices
resource "kafka_topic" "internal_bex_bill_regeneration_large_invoice" {
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
  }
}

# this topic is used in the bill regeneration pipeline
# used for retrying the bill regeneration on failure
resource "kafka_topic" "internal_bex_bill_regeneration_deadletter" {
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
  }
}

