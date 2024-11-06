resource "kafka_topic" "account_identity_dpd_v1" {
  name               = "auth-customer.account-identity-dpd-v1"
  replication_factor = 3
  partitions         = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 7 days
    "retention.ms" = "604800000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

# Existing iam dpd mapper config is in ../iam/iam.tf
module "iam_dpd_mapper" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.account_identity_dpd_v1.name]
  cert_common_name = "auth-customer/dpd-mapper"
}
