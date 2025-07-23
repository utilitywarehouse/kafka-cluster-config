module "meterpoint_gentrack_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_meterpoint_events.name,
  ]
  consume_groups   = ["energy-platform.meterpoint-gentrack-projector"]
  cert_common_name = "energy-platform/meterpoint-gentrack-projector"
}

module "meterpoints_v2_gentrack_supply_loss_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_market_interactions_events.name,
  ]
  consume_groups   = ["energy-platform.meterpoints-v2-gentrack-supply-loss-projector"]
  cert_common_name = "energy-platform/meterpoints-v2-gentrack-supply-loss-projector"
}
