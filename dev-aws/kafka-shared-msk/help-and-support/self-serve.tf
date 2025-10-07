resource "kafka_topic" "self_serve_form_submissions" {
  name = "help-and-support.self_serve_form_submissions"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "self_serve_form_submissions_dlq" {
  name = "help-and-support.self_serve_form_submissions_dlq"

  replication_factor = 3
  partitions         = 5

  config = {
    "remote.storage.enable" = "true"
    "local.retention.ms"    = "259200000"  # keep data in primary storage for 3 days
    "retention.ms"          = "2629800000" # keep data for 1 month
    "max.message.bytes"     = "104857600"  # allow for a batch of records maximum 100MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

# Produce to help-and-support.self_serve_form_submissions
module "self_serve_form_submissions_producer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "help-and-support/self-serve-form-submissions-producer"
  produce_topics   = [kafka_topic.self_serve_form_submissions.name]
}

# Consume from help-and-support.self_serve_form_submissions
module "self_serve_form_submissions_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "help-and-support/self-serve-form-submissions-consumer"
  consume_topics   = [kafka_topic.self_serve_form_submissions.name]
  consume_groups   = ["help-and-support.self_serve_form_submissions_consumer"]
}

# Produce to help-and-support.self_serve_form_submissions
module "self_serve_form_submissions_producer_dlq" {
  source           = "../../../modules/tls-app"
  cert_common_name = "help-and-support/self-serve-form-submissions-dlq-producer"
  produce_topics   = [kafka_topic.self_serve_form_submissions_dlq.name]
}

# Consume from help-and-support.self_serve_form_submissions_dlq
module "self_serve_form_submissions_dlq_consumer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "help-and-support/self-serve-form-submissions-dlq-consumer"
  consume_topics   = [kafka_topic.self_serve_form_submissions_dlq.name]
  consume_groups   = ["help-and-support.self_serve_form_submissions_dlq_consumer"]
}