# Producer to contact-channels.tracking_events
module "nps_survey_response" {
  source           = "../../../modules/tls-app"
  cert_common_name = "digital-support/nps-survey-response"
  produce_topics   = [kafka_topic.tracking_events.name]
}

# Producer to contact-channels.tracking_events
module "survey_response" {
  source           = "../../../modules/tls-app"
  cert_common_name = "digital-support/survey-response"
  produce_topics   = [kafka_topic.tracking_events.name]
}
