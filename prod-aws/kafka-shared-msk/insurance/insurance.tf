# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "public_policies_v1" {
  name = "insurance.public.policies.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

module "insurance_event_relay_public" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.public_policies_v1.name]
  cert_common_name = "insurance/event-relay-public"
}

module "insurance_event_log" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.public_policies_v1.name]
  consume_groups   = ["insurance.event-log"]
  cert_common_name = "insurance/event-log"
}

module "insurance_proximo" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.public_policies_v1.name]
  consume_topics   = [kafka_topic.public_policies_v1.name]
  consume_groups   = ["insurance.event-log"]
  cert_common_name = "insurance/proximo"
}
