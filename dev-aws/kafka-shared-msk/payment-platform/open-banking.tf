resource "kafka_topic" "openbanking-v1-internal-payments" {
  name               = "payment-platform.openbanking.v1.internal.payments"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "openbanking-deadletter-v1-internal-payments" {
  name               = "payment-platform.openbanking-deadletter.v1.internal.payments"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "openbanking-v1-internal-payment-methods" {
  name               = "payment-platform.openbanking.v1.internal.payment-methods"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "openbanking-deadletter-v1-internal-payment-methods" {
  name               = "payment-platform.openbanking-deadletter.v1.internal.payment-methods"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment-v1-events" {
  name               = "payment-platform.payment.v1.events"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 30 days
    "retention.ms"   = "2592000000"
    "cleanup.policy" = "delete"
  }
}
