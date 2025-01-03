resource "kafka_topic" "card_v1_internal" {
  name               = "payment-platform.card.v1.internal"
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

resource "kafka_topic" "card_deadletter_v1_internal" {
  name               = "payment-platform.card-deadletter.v1.internal"
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

resource "kafka_topic" "card_v1_internal_3ds" {
  name               = "payment-platform.card.v1.internal.3ds"
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

resource "kafka_topic" "card_deadletter_v1_internal_3ds" {
  name               = "payment-platform.card-deadletter.v1.internal.3ds"
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

resource "kafka_topic" "card_v1_internal_payment_methods" {
  name               = "payment-platform.card.v1.internal.payment-methods"
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

resource "kafka_topic" "card_deadletter_v1_internal_payment_methods" {
  name               = "payment-platform.card-deadletter.v1.internal.payment-methods"
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
