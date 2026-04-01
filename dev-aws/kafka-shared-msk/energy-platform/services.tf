module "services_provisioning_processor" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_market_interactions_events.name,
  ]
  consume_groups   = ["energy-platform.services-provisioning-processor"]
  cert_common_name = "energy-platform/services-provisioning-processor"
}
