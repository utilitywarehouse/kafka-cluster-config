module "support" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.events.name]
  consume_groups   = ["data-infra.support"]
  cert_common_name = "data-infra/support"
}
