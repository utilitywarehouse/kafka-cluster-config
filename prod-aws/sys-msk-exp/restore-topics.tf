resource "kafka_topic" "challenge_events_v1" {
  name = "cbc.ChallengeEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
