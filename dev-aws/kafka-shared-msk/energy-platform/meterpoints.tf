module "meterpoint_gentrack_meterpoint_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.gentrack_meterpoint_events.name,
  ]
  cert_common_name = "energy-platform/meterpoint_gentrack_meterpoint_projector"
}
