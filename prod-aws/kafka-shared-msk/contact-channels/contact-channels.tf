resource "kafka_topic" "genesys_eb_events" {
  name = "contact-channels.genesys_eb_events"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "finished_conversations" {
  name = "contact-channels.finished_conversations"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # keep data for 1 day
    "max.message.bytes" = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "finished_transcriptions" {
  name = "contact-channels.finished_transcriptions"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # keep data for 1 day
    "max.message.bytes" = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "finished_segments" {
  name = "contact-channels.finished_segments"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "messenger_transcript_events" {
  name = "contact-channels.messenger_transcript_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "messenger_transcript_events_dlq" {
  name = "contact-channels.messenger_transcript_events_dlq"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "article_feedback_v1" {
  name = "contact-channels.article_feedback_v1"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "tracking_events" {
  name = "contact-channels.tracking_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "intents_v2" {
  name = "contact-channels.intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "validated_intents_v2" {
  name = "contact-channels.validated_intents_v2"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "172800000" # keep data for 2 days
    "max.message.bytes" = "1048576"   # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "interactions_state_events" {
  name = "contact-channels.interactions_state_events"

  replication_factor = 3
  partitions         = 3

  config = {
    "retention.ms"      = "86400000" # keep data for 1 day
    "max.message.bytes" = "1048576"  # allow for a batch of records maximum 1MiB
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "dsar" {
  name = "contact-channels.dsar"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "dsar_job" {
  name = "contact-channels.dsar_job"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "dsar_conversation" {
  name = "contact-channels.dsar_conversation"

  replication_factor = 3
  partitions         = 9

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
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

# Producer to contact-channels.intents_v2
module "intent_fabricator" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/intent-fabricator"
  produce_topics   = [kafka_topic.intents_v2.name]
}

# Consume from contact-channels.intents_v2
module "intent_bq_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/intent-bq-projector"
  consume_topics   = [kafka_topic.intents_v2.name]
  consume_groups   = ["contact-channels.intent-bq-projector"]
}

# Producer to contact-channels.validated_intents_v2
module "intent_service" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/intent-service"
  produce_topics   = [kafka_topic.validated_intents_v2.name]
}

# Consume from contact-channels.validated_intents_v2
module "intent_validation_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/intent-validation-projector"
  consume_topics   = [kafka_topic.validated_intents_v2.name]
  consume_groups   = ["contact-channels.intent-validation-projector"]
}

# Consume from contact-channels.tracking_events
module "survey_responses_bq_projector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/survey-responses-bq-projector"
  consume_topics   = [kafka_topic.tracking_events.name]
  consume_groups   = ["contact-channels.survey-responses-bq-projector"]
}

# Consume from contact-channels.tracking_events
module "agent_state_builder" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/agent-state-builder"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.eb-kafka-agent-state-builder"]
  produce_topics   = [kafka_topic.interactions_state_events.name]
}

# Consume from contact-channels.interactions_state_events
module "agent_state_service" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/agent-state-service"
  consume_topics   = [kafka_topic.interactions_state_events.name]
  produce_topics   = [kafka_topic.interactions_state_events.name]
}

# Consume from contact-channels.genesys_eb_events (ES Topic Indexer)
module "genesys_eb_events_es_indexer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/genesys-eb-events-indexer"
  consume_topics   = [kafka_topic.genesys_eb_events.name]
  consume_groups   = ["contact-channels.genesys-eb-events-indexer"]
}

# Consume from contact-channels.interactions_state_events (ES Topic Indexer)
module "interactions_state_events_es_indexer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/interactions-state-events-indexer"
  consume_topics   = [kafka_topic.interactions_state_events.name]
  consume_groups   = ["contact-channels.interactions-state-events-indexer"]
}

# Produce to contact-channels.dsar
module "dsar_request_producer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/dsar-request-producer"
  produce_topics   = [kafka_topic.dsar.name]
}

# Consume from contact-channels.dsar
module "dsar_request_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/dsar-request-consumer"
  consume_topics   = [kafka_topic.dsar.name]
  consume_groups   = ["contact-channels.dsar-request-consumer"]
}

# Produce to contact-channels.dsar-jobs and conversations
module "dsar_job_request_producer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/dsar-job-runner"
  produce_topics   = [kafka_topic.dsar_job.name, kafka_topic.dsar_conversation.name]
}

# Consume from contact-channels.dsar-conversations
module "dsar_conversations_retriever" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/dsar-conversations-retriever"
  consume_topics   = [kafka_topic.dsar_conversation.name]
  consume_groups   = ["contact-channels.dsar-conversations-retriever"]
}

# Consume from contact-channels.dsar-jobs
module "dsar_job_fulfiller" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/dsar-job-fulfiller"
  consume_topics   = [kafka_topic.dsar_job.name]
  consume_groups   = ["contact-channels.dsar-job-fulfiller"]
}

# Producer to contact-channels.tracking_events
module "survey_response_collector" {
  source           = "../../../modules/tls-app"
  cert_common_name = "contact-channels/survey-response-collector"
  produce_topics   = [kafka_topic.tracking_events.name]
}
