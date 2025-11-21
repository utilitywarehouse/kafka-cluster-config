# --- Auth config for the backup of insurance kafka topics ---
module "insurance_event_relay_backup" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.private_policies_v1.name,
  ]
  consume_groups = ["insurance.event-relay-backup"]
  produce_topics = [
    kafka_topic.private_policies_v1.name,
  ]
  cert_common_name = "insurance/event-relay-backup"
}


# --- List of kafka insurance topics to be backed up ---
resource "kafka_topic" "private_policies_v1" {
  name = "insurance.private.policies.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"       = "-1"      # keep data forever
    "local.retention.ms" = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"  = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"   = "zstd"
    "cleanup.policy"     = "delete"
  }
}
