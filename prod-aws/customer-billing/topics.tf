resource "kafka_topic" "finance-invoice-model" {
  name               = "finance-invoice-model"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 100MB for a message
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice-fulfilment-event" {
  name               = "invoice-fulfilment-event"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 100MB for a message
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice-delivery-events" {
  name               = "invoice-delivery-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "email-delivery-engine-send-failures" {
  name               = "email-delivery-engine-send-failures"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice-fulfilment-event-deadletter" {
  name               = "invoice-fulfilment-event-deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice-redelivery-rejections" {
  name               = "invoice-redelivery-rejections"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "public-fulfilment-events" {
  name               = "public-fulfilment-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    "retention.ms"     = "-1"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "replicated-billing-engine-events" {
  name               = "replicated-billing-engine-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "-1"
    "retention.ms"     = "-1"
    # allow max 100MB for a message
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "replicated-internal-bill-core-model" {
  name               = "replicated-internal-bill-core-model"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 100MB for a message
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "replicated-bill-extracts-historic-model" {
  name               = "replicated-bill-extracts-historic-model"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 100MB for a message
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "customer-change" {
  name               = "customer-change"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "legacy-data-deadletter" {
  name               = "legacy-data-deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "legacy-accounts-deadletter" {
  name               = "legacy-accounts-deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "account-balance-change-deadletter" {
  name               = "account-balance-change-deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "billing-comms-preferences-events" {
  name               = "billing-comms-preferences-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 100MB for a message
    "max.message.bytes" = "104857600"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "deadletter-billing-comms-preferences-events" {
  name               = "deadletter-billing-comms-preferences-events"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "account-payment-details_v1" {
  name               = "account-payment-details.v1"
  replication_factor = 3
  partitions         = 10
  config = {
    "compression.type" = "zstd"
    # retain 8GB on each partition
    "retention.bytes" = "8053063680"
    # allow max 1MB for a message
    "max.message.bytes" = "1048588"
    "cleanup.policy"    = "delete"
  }
}
