resource "kafka_topic" "mail_sender_deadletter" {
  name               = "bex.internal.mail_sender_deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}