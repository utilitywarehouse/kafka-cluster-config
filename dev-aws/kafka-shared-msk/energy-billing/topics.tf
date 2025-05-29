resource "kafka_topic" "internal_energy_billing_billing_adapter_deadletter" {
  name               = "energy-billing.internal.billing-adapter-deadletter"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 28 days
    "retention.ms" = "2419200000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# this topic is used in the bill generation pipeline
# used for retrying the bill generation on failure
resource "kafka_topic" "internal_energy_billing_billing_adapter_retry_1" {
  name               = "energy-billing.internal.billing-adapter-retry-1"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"
  }
}

# this topic is used in the bill generation pipeline
# used for retrying the bill generation on failure
resource "kafka_topic" "internal_energy_billing_billing_adapter_retry_2" {
  name               = "energy-billing.internal.billing-adapter-retry-2"
  replication_factor = 3
  partitions         = 5
  config = {
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    "compression.type"   = "zstd"
    "retention.bytes"    = "8053063680" # keep on each partition 7.5GiB
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "cleanup.policy"    = "delete"
    # keep data for 3 days
    "retention.ms" = "259200000"
  }
}
