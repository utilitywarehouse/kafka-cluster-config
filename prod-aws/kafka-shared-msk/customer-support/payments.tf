resource "kafka_topic" "payments_audit_log_v1" {
  config = {
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for a day
    "local.retention.ms" = "86400000"
    # keep data forever
    "retention.ms" = "-1"
  }
  name               = "customer-support.payments_audit_log_v1"
  partitions         = 10
  replication_factor = 3
}

module "payments" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/payments"
  produce_topics = [
    kafka_topic.payments_audit_log_v1.name,
  ]
}
