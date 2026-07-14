resource "kafka_topic" "billing_transaction_log_v3" {
  name               = "billing.transaction-log-v3"
  replication_factor = 3
  partitions         = 10
  config = {
    # use tiered storage
    "remote.storage.enable" = "true"
    # store data zstd compressed
    "compression.type" = "zstd"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1.1 months
    "retention.ms" = "2764800000"
    # making sure cleanup policy is not compaction 
    "cleanup.policy" = "delete"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes" = "104857600"
  }
}
