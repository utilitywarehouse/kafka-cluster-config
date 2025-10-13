resource "kafka_topic" "self_serve_submissions" {
  name = "help-and-support.self_serve_submissions"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "self_serve_submissions_dlq" {
  name = "help-and-support.self_serve_submissions_dlq"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

# Produce to help-and-support.self_serve_submissions
module "self_serve_service" {
  source           = "../../../modules/tls-app"
  cert_common_name = "help-and-support/self-serve-service"
  produce_topics   = [kafka_topic.self_serve_submissions.name]
}

# Consume from help-and-support.self_serve_submissions & help-and-support.self_serve_submissions_dlq
module "self_serve_submission_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "help-and-support/self-serve-submission-consumer"
  consume_topics = [
    kafka_topic.self_serve_submissions.name,
    kafka_topic.self_serve_submissions_dlq.name
  ]
  consume_groups = [
    "help-and-support.self-serve-submission-consumer",
    "help-and-support.self-serve-submission-consumer-dlq"
  ]
  produce_topics = [kafka_topic.self_serve_submissions_dlq.name]
}