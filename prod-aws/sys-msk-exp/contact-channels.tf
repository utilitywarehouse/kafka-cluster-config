resource "kafka_topic" "genesys_eb_events" {
  name = "contact-channels.genesys_eb_events"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "finished_conversations" {
  name = "contact-channels.finished_conversations"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "finished_transcriptions" {
  name = "contact-channels.finished_transcriptions"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "finished_segments" {
  name = "contact-channels.finished_segments"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "messenger_transcript_events" {
  name = "contact-channels.messenger_transcript_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "messenger_transcript_events_dlq" {
  name = "contact-channels.messenger_transcript_events_dlq"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "article_feedback_v1" {
  name = "contact-channels.article_feedback_v1"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "tracking_events" {
  name = "contact-channels.tracking_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "intents_v2" {
  name = "contact-channels.intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "validated_intents_v2" {
  name = "contact-channels.validated_intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "172800000" # keep data for 2 days
    "max.message.bytes"                   = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "interactions_state_events" {
  name = "contact-channels.interactions_state_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "sent_agent_states" {
  name = "contact-channels.sent_agent_states"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"                        = "86400000" # keep data for 1 day
    "max.message.bytes"                   = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "dsar" {
  name = "contact-channels.dsar"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "dsar_job" {
  name = "contact-channels.dsar_job"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "dsar_conversation" {
  name = "contact-channels.dsar_conversation"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable"               = "true"
    "local.retention.ms"                  = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"                        = "2629800000" # keep data for 1 month
    "max.message.bytes"                   = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
