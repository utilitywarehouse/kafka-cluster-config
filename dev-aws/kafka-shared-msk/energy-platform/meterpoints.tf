module "meterpoint_gentrack_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_meterpoint_events.name,
  ]
  consume_groups   = ["energy-platform.meterpoint-gentrack-projector"]
  cert_common_name = "energy-platform/meterpoint-gentrack-projector"
}
