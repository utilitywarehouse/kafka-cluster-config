module "unicom_caps_consent_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ['unicom.caps']
  consume_groups   = ["unicom.caps-consent-projector"]
  cert_common_name = "unicom/caps_consent_projector"
}

module "unicom_unit_sender_letter_go_inspire" {
  source         = "../../../modules/tls-app"
  consume_topics = [
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1"
  ]
  consume_groups = ['unicom.unit-sender-letter-go-inspire']
  produce_topics = [
    "unicom.unicom-letter-status.1",
    "unicom.tests", "unicom.cost-calculated.1",
    "unicom.unicom-rendered.1",
    "unicom.failed",
    "unicom.comms-fallback"
  ]
  cert_common_name = "unicom/unit_sender_letter_go_inspire"
}

module "unicom_unit_sender_email" {
  source         = "../../../modules/tls-app"
  consume_topics = [
    "unicom.email-released-ses-critical.1",
    "unicom.email-released-ses-important.1",
    "unicom.email-released-ses.1"
  ]
  consume_groups = ["unicom.unit-sender-email"]
  produce_topics = [
    "unicom.email-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.unicom-rendered.1",
    "unicom.failed",
    "unicom.comms-fallback"
  ]
  cert_common_name = "unicom/unit_sender_email"
}

module "unicom_mock_clx_report" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.clx-report"]
  consume_groups   = ["unicom.clx-report"]
  produce_topics   = ["unicom.tests"]
  cert_common_name = "unicom/mock_clx_report"
}

module "unicom_bounce_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.bounce.2019.1"]
  consume_groups   = ["unicom.bounce-projector"]
  produce_topics   = ["unicom.bounce.2019.1"]
  cert_common_name = "unicom/bounce_projector"
}

module "unicom_tracking_v2" {
  source         = "../../../modules/tls-app"
  consume_topics = [
    "unicom.scheduled.1",
    "unicom.email-released-critical.1",
    "unicom.email-released-important.1",
    "unicom.email-released.1",
    "unicom.email-status.1",
    "unicom.sms-released-critical.1",
    "unicom.sms-released-important.1",
    "unicom.sms-released.1",
    "unicom.sms-status.1",
    "unicom.unicom-email-post-delivery.1",
    "unicom.rendered.1",
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1",
    "unicom.letter-status.1",
  ]
  consume_groups   = ["unicom.tracking-v2"]
  produce_topics   = ["unicom.status-v2"]
  cert_common_name = "unicom/tracking_v2"
}

module "unicom_comms_fallback_sender" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.comms-fallback.1"]
  consume_groups   = ["unicom.comms-fallback-sender"]
  cert_common_name = "unicom/comms_fallback_sender"
}

module "unicom_unit_sender_push_notification" {
  source           = "../../../modules/tls-app"
  consume_topics   = [
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1"
  ]
  consume_groups   = ["unicom.unit-sender-letter"]
  produce_topics   = [
    "unicom.push-notification-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.unicom-rendered.1",
    "unicom.failed",
    "unicom.comms-fallback.1"
  ]
  cert_common_name = "unicom/unit_sender_push_notification"
}

module "unicom_failed_retrigger" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.failed"]
  consume_groups   = ["unicom.failed-retrigger"]
  produce_topics   = [
    "unicom.email-released.1",
    "unicom.sms-released.1",
    "unicom.push-notification-released.1",
    "unicom.letter-released.1"
  ]
  cert_common_name = "unicom/failed_retrigger"
}

module "unicom_rendered_letter_fabricator" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.letter-status.1"]
  consume_groups   = ["unicom.rendered-letter-fabricator"]
  produce_topics   = [
    "unicom.rendered.1",
    "unicom.cost-calculated.1",
    "unicom.letter-status.1",
  ]
  cert_common_name = "unicom/rendered_letter_fabricator"
}

module "unicom_batch_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = [
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1"

  ]
  consume_groups   = ["unicom.batch_projector"]
  produce_topics   = [
    "unicom.letter-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.unicom-rendered.1",
    "unicom.failed",
    "unicom.comms-fallback.1",
  ]
  cert_common_name = "unicom/batch_projector"
}

module "unicom_otc_reporting_webhook" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["unicom.letter-status.1"]
  cert_common_name = "unicom/otc_reporting_webhook"
}

module "unicom_clx_report" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["unicom.clx-report"]
  cert_common_name = "unicom/clx_report"
}

module "unicom_consumer" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.requests"]
  consume_groups   = ["unicom.consumer"]
  produce_topics   = ["unicom.rejected"]
  cert_common_name = "unicom/consumer"
}

module "unicom_unit_sender_letter_stannp" {
  source           = "../../../modules/tls-app"
  consume_topics   = [
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1"
  ]
  consume_groups   = ["unicom.unit-sender-letter-stannp"]
  produce_topics   = [
    "unicom.unicom-letter-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.unicom-rendered.1",
    "unicom.failed",
    "unicom.comms-fallback"
  ]
  cert_common_name = "unicom/unit_sender_letter_stannp"
}

module "unicom_batch_releaser" {
  source           = "../../../modules/tls-app"
  produce_topics   = [
    "unicom.email-batch.1",
    "unicom.sms-batch.1",
    "unicom.letter-batch.1",
  ]
  cert_common_name = "unicom/batch_releaser"
}

module "unicom_router" {
  source           = "../../../modules/tls-app"
  consume_topics   = [
  "unicom.email-released-critical.1",
    "unicom.email-released-important.1",
    "unicom.email-released.1",

  ]
  consume_groups   = ["unicom.router"]
  produce_topics   = [
    "unicom.email-released-ses-critical.1",
    "unicom.email-released-ses-important.1",
    "unicom.email-released-ses.1",
    "unicom.email-released-mock.1"
  ]
  cert_common_name = "unicom/router"
}

module "unicom_ses_mock" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["unicom.tests"]
  cert_common_name = "unicom/ses_mock"
}

module "unicom_stannp_reporting" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["unicom.letter-status.1", "unicom.cost_calculated.1"]
  cert_common_name = "unicom/stannp_reporting"
}

module "unicom_schedule" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.scheduled.1"]
  consume_groups   = ["unicom.schedule_projector"]
  cert_common_name = "unicom/schedule"
}

module "unicom_es_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/es_connector"
}

module "unicom_unit_sender_sms" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/unit_sender_sms"
}

module "unicom_outbound_call_api" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/outbound_call_api"
}

module "unicom_api" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/api"
}

module "unicom_outbound_calls_bq_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/outbound_calls_bq_connector"
}

module "unicom_bq_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/bq_connector"
}

module "unicom_otc_letter_cancellation" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/otc_letter_cancellation"
}

module "unicom_sqs_relay" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/sqs_relay"
}

module "unicom_unit_sender_letter_otc" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/unit_sender_letter_otc"
}

module "unicom_unit_sender_email_mock" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/unit_sender_email_mock"
}

module "unicom_consumer_api" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/consumer_api"
}

module "unicom_probe" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/probe"
}

module "unicom_tracking" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/tracking"
}

module "unicom_unit_sender_letter" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/unit_sender_letter"
}

module "unicom_batch_sender" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/batch_sender"
}

module "unicom_filter_cancellation" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/filter_cancellation"
}

module "unicom_external_comms_api" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "unicom/external_comms_api"
}