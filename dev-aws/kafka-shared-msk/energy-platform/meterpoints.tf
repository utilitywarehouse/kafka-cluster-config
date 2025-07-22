module "meterpoint_gentrack_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_meterpoint_events.name,
  ]
  consume_groups   = ["energy-platform.meterpoint-gentrack-projector"]
  cert_common_name = "energy-platform/meterpoint-gentrack-projector"
}

module "meterpoints_v2_supply_projector_supply_loss" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_market_interactions_events.name,
  ]
  consume_groups   = ["energy-platform.meterpoint-v2-supply-projector-supply-loss"]
  cert_common_name = "energy-platform/meterpoint-v2-supply-projector-supply-loss"
}
