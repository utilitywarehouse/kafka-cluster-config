resource "kafka_topic" "payment_gateway_reconciliation" {
  name               = "payment-platform.payment.gateway.reconciliation"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

resource "kafka_topic" "payment_gateway_reconciliation_status_changed" {
  name               = "payment-platform.payment.gateway.reconciliation.status-changed"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384" # keep on each partition 3.5GB
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

module "payment_gateway_reconciler" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.payment_enriched_txs.name,
    kafka_topic.notifications_tx.name,
    kafka_topic.payment_gateway_reconciliation_status_changed.name,
  ]
  produce_topics = [
    kafka_topic.payment_gateway_reconciliation.name,
    kafka_topic.payment_gateway_reconciliation_status_changed.name,
  ]
  consume_groups   = ["payment-platform.payment-gateway-reconciler-for-reconciler-db"]
  cert_common_name = "payment-platform/payment-gateway-reconciler"
}
