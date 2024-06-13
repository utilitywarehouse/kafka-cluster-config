resource "kafka_topic" "openbanking_v1_internal_payments" {
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

resource "kafka_topic" "openbanking_deadletter_v1_internal_payments" {
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

resource "kafka_topic" "openbanking_v1_internal_payment_methods" {
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

resource "kafka_topic" "openbanking_deadletter_v1_internal_payment_methods" {
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

module "openbanking_apid" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.openbanking_v1_internal_payments.name,
    kafka_topic.openbanking_v1_internal_payment_methods.name,
    kafka_topic.payment_v1_events.name
  ]
  cert_common_name = "payment-platform/openbanking-apid"
}

module "openbanking_consumerd" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.openbanking_deadletter_v1_internal_payments.name,
    kafka_topic.openbanking_deadletter_v1_internal_payment_methods.name,
    kafka_topic.payment_v1_events.name
  ]
  consume_topics = [
    kafka_topic.openbanking_v1_internal_payments.name,
    kafka_topic.openbanking_v1_internal_payment_methods.name
  ]
  consume_groups   = ["payment-platform.openbanking_consumerd"]
  cert_common_name = "payment-platform/openbanking-consumerd"
}

module "openbanking_crond" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.payment_v1_events.name
  ]
  consume_groups   = ["payment-platform.openbanking_crond"]
  cert_common_name = "payment-platform/openbanking-crond"
}
