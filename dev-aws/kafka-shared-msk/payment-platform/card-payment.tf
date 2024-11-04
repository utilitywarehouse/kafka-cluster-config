resource "kafka_topic" "payment_payment" {
  name               = "payment-platform.payment.payment"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_method_created" {
  name               = "payment-platform.payment.method-created"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_method_verified" {
  name               = "payment-platform.payment.method-verified"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_method_linked" {
  name               = "payment-platform.payment.method-linked"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

module "payment_transaction_events_forwarder" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.payment_payment.name,
    kafka_topic.payment_method_verified.name,
    kafka_topic.payment_method_linked.name,
    kafka_topic.payment_method_created.name,
    kafka_topic.notifications_tx.name,
    kafka_topic.payment_analysis_payment_method.name,
  ]
  produce_topics = [
    kafka_topic.payment_data_staged.name,
  ]
  consume_groups   = ["payment-platform.payment-transaction-events-forwarder"]
  cert_common_name = "payment-platform/payment-transaction-events-forwarder"
}
