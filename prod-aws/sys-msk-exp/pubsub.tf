resource "kafka_topic" "plan_restore" {
  name               = "pubsub.plan-topic-restore"
  replication_factor = 3
  partitions         = 15
  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "86400000" # keep data in primary storage for 1 day
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow for a batch of records maximum 100MiB
    "max.message.bytes"                   = "104857600"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "proximo_example" {
  name               = "pubsub.proximo-example"
  replication_factor = 3
  partitions         = 3
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "pubsub_examples" {
  name               = "pubsub.examples"
  replication_factor = 3
  partitions         = 3
  config = {
    # keep on each partition 100MiB
    "retention.bytes" = "104857600"
    # keep data for 2 days
    "retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes"                   = "1048576"
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
