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

module "openbanking-apid" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.openbanking-v1-internal-payments.name, kafka_topic.openbanking-v1-internal-payment-methods.name, kafka_topic.payment-v1-events.name]
  cert_common_name = "payment-platform/openbanking-apid"
}

module "openbanking-consumerd" {
  source           = "../../modules/tls-app"
  produce_topics   = [kafka_topic.openbanking-deadletter-v1-internal-payments.name, kafka_topic.openbanking-deadletter-v1-internal-payment-methods.name, kafka_topic.payment-v1-events.name]
  consume_topics   = [kafka_topic.openbanking-v1-internal-payments.name, kafka_topic.openbanking-v1-internal-payment-methods.name]
  consume_groups   = ["payment-platform.openbanking_consumerd"]
  cert_common_name = "payment-platform/openbanking-consumerd"
}
