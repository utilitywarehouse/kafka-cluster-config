resource "kafka_topic" "genesys_eb_events" {
  name = "contact-channels.genesys_eb_events"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # 3 days
    "retention.ms"          = "2629800000" # 1 month
    "max.message.bytes"     = "104857600"  # 100MB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

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

resource "kafka_topic" "messenger_transcript_events" {
  name = "contact-channels.messenger_transcript_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # 48 hours
    "max.message.bytes" = "1048576"   # 1MB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "messenger_transcript_events_dlq" {
  name = "contact-channels.messenger_transcript_events_dlq"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # 48 hours
    "max.message.bytes" = "1048576"   # 1MB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "article_feedback_v1" {
  name = "contact-channels.article_feedback_v1"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # 48 hours
    "max.message.bytes" = "1048576"   # 1MB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "tracking_events" {
  name = "contact-channels.tracking_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # 48 hours
    "max.message.bytes" = "1048576"   # 1MB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "intents_v2" {
  name = "contact-channels.intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000" # 3 days
    "retention.ms"          = "-1"        # Indefinitely retention
    "max.message.bytes"     = "104857600" # 100MB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "validated_intents_v2" {
  name = "contact-channels.validated_intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000" # 3 days
    "retention.ms"          = "-1"        # Indefinitely retention
    "max.message.bytes"     = "104857600" # 100MB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

## TLS App

# Consume from contact-channels.genesys_eb_events for Last Contact Digital Survey Projector
module "last_contact_projector_service" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/last-contact-projector"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.digital-survey-service-last-contact-projector"]
}

# Consume from contact-channels.genesys_eb_events for Attributes BQ
module "attributes_bq_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/attributes-bq-consumer"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.eb-kafka-attributes-bq-consumer"]
}

# Consume from contact-channels.genesys_eb_events for Auto Email Verification
module "email_verification" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/email-verification"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.eb-kafka-email-verification-service"]
}

# Consume from contact-channels.genesys_eb_events and produce to contact-channels.finished_segments
module "segment_gatherer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/segment-gatherer"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.eb-kafka-segment-gatherer"]
  produce_topics   = [kafka_topic.finished_segments.name]
}

# Consume from contact-channels.genesys_eb_events and produce to contact-channels.finished_conversations
module "transcription_gatherer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/transcription-gatherer"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.eb-kafka-transcription-gatherer"]
  produce_topics   = [kafka_topic.finished_conversations.name]
}

# Consume from contact-channels.finished_segments and produce to contact-channels.finished_transcriptions
module "segment_aggregator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/segment-aggregator"
  consume_topics   = [kafka_topic.finished_segments.name]
  consume_groups   = ["contact-channels.eb-kafka-segment-aggregator"]
  produce_topics   = [kafka_topic.finished_transcriptions.name]
}

# Consume from contact-channels.finished_conversations and produce to contact-channels.finished_transcriptions
module "transcription_aggregator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/transcription-aggregator"
  consume_topics   = [kafka_topic.finished_conversations.name]
  consume_groups   = ["contact-channels.eb-kafka-transcription-aggregator"]
  produce_topics   = [kafka_topic.finished_transcriptions.name]
}

# Consume from contact-channels.finished_transcriptions.
module "transcription_segment_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/transcription-segment-projector"
  consume_topics   = [kafka_topic.finished_transcriptions.name]
  consume_groups   = ["contact-channels.call-transcription-segment-projector"]
}

# Consume from contact-channels.genesys_eb_events and produce to contact-channels.messenger_transcript_events
module "missing_transcript_retriever" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/missing-transcript-retriever"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.eb-missing-transcript-retriever"]
  produce_topics   = [kafka_topic.messenger_transcript_events.name, kafka_topic.messenger_transcript_events_dlq.name]
}

# Consume from contact-channels.messenger_transcript_events
module "message_transcriptions_kafka_bq" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/message-transcriptions-kafka-bq"
  consume_topics   = [kafka_topic.messenger_transcript_events.name]
  consume_groups   = ["contact-channels.message-transcriptions-kafka-bq"]
}

# Consume from contact-channels.article_feedback_v1
module "article_feedback_bq_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/article-feedback-bq-projector"
  consume_topics   = [kafka_topic.article_feedback_v1.name]
  consume_groups   = ["contact-channels.article-feedback-bq-projector"]
}

# Genesys EB Events (SQS) produce to -> contact-channels.genesys_eb_events
module "sqs_kafka_broadcaster" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/sqs-kafka-broadcaster"
  produce_topics   = [kafka_topic.genesys_eb_events.name]
}
