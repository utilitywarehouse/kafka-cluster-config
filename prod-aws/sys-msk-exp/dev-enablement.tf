resource "kafka_topic" "connect_configs" {
  name               = "dev-enablement.connect-configs"
  partitions         = 1
  replication_factor = 3

  config = {
    "cleanup.policy"                      = "compact"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "connect_offsets" {
  name               = "dev-enablement.connect-offsets"
  partitions         = 25
  replication_factor = 3

  config = {
    "cleanup.policy"                      = "compact"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "connect_status" {
  name               = "dev-enablement.connect-status"
  partitions         = 5
  replication_factor = 3

  config = {
    "cleanup.policy"                      = "compact"
    "compression.type"                    = "zstd"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
