resource "kafka_topic" "payment_analysis_payment_method" {
  name               = "payment-platform.payment-analysis.payment-method"
  replication_factor = 3
  partitions         = 5
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}