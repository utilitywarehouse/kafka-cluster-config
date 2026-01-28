resource "kafka_topic" "self_serve_submissions" {
  name = "help-and-support.self_serve_submissions"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "self_serve_submissions_dlq" {
  name = "help-and-support.self_serve_submissions_dlq"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
