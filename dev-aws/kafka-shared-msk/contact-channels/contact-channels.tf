resource "kafka_topic" "finished_conversations" {
  name = "contact-channels.finished_conversations"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # 24 hours
    "max.message.bytes" = "1048576"  # 1MB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "finished_transcriptions" {
  name = "contact-channels.finished_transcriptions"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # 24 hours
    "max.message.bytes" = "1048576"  # 1MB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "finished_segments" {
  name = "contact-channels.finished_segments"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # 48 hours
    "max.message.bytes" = "1048576"   # 1MB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}
