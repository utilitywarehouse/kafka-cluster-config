resource "kafka_topic" "FraudEvents" {
  name = "cbc.FraudEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"
    "retention.ms"          = "-1"
    "local.retention.ms"    = "3600000" # keep data locally for 1 hour
    "max.message.bytes"     = "2097152" # allow max 2MB for a message
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}
