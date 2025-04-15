module "unicom_caps_consent_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.caps"]
  consume_groups   = ["unicom.caps-consent-projector"]
  cert_common_name = "unicom/caps_consent_projector"
}

module "unicom_unit_sender_email" {
  source = "../../../modules/tls-app"
  consume_topics = [
    "unicom.email-released-critical.1",
    "unicom.email-released-important.1",
    "unicom.email-released.1"
  ]
  consume_groups = ["unicom.unit-sender-email"]
  produce_topics = [
    "unicom.email-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.rendered.1",
    "unicom.failed",
    "unicom.comms-fallback.1"
  ]
  cert_common_name = "unicom/unit_sender_email"
}

module "unicom_bounce_projector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.bounce.2019.1"]
  consume_groups   = ["unicom.bounce-projector"]
  produce_topics   = ["unicom.bounce.2019.1"]
  cert_common_name = "unicom/bounce_projector"
}

module "unicom_tracking_v2" {
  source = "../../../modules/tls-app"
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
    "unicom.email-post-delivery.1",
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

module "unicom_stannp_reporting" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["unicom.letter-status.1", "unicom.cost-calculated.1"]
  cert_common_name = "unicom/stannp_reporting"
}

module "unicom_failed_retrigger" {
  source         = "../../../modules/tls-app"
  consume_topics = ["unicom.failed"]
  consume_groups = ["unicom.failed"]
  produce_topics = [
    "unicom.email-released.1",
    "unicom.sms-released.1",
    "unicom.letter-released.1"
  ]
  cert_common_name = "unicom/failed_retrigger"
}

module "unicom_rendered_letter_fabricator" {
  source         = "../../../modules/tls-app"
  consume_topics = ["unicom.letter-status.1"]
  consume_groups = ["unicom.letter-fabricator"]
  produce_topics = [
    "unicom.rendered.1",
    "unicom.cost-calculated.1",
    "unicom.letter-status.1",
  ]
  cert_common_name = "unicom/rendered_letter_fabricator"
}

module "unicom_batch_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1"

  ]
  consume_groups = ["unicom.batch_projector"]
  produce_topics = [
    "unicom.letter-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.rendered.1",
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

module "unicom_batch_releaser" {
  source = "../../../modules/tls-app"
  produce_topics = [
    "unicom.email-batch.1",
    "unicom.sms-batch.1",
    "unicom.letter-batch.1",
  ]
  cert_common_name = "unicom/batch_releaser"
}

module "unicom_monitoring_clx_report" {
  source         = "../../../modules/tls-app"
  consume_topics = ["unicom.clx-report"]
  consume_groups = ["unicom.monitoring-clx-report"]
  produce_topics = [
    "unicom.sms-status.1",
    "unicom.bounce.2019.1",
    "unicom.cost-calculated.1"
  ]
  cert_common_name = "unicom/monitoring-clx-report"
}

module "unicom_schedule" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.scheduled.1"]
  consume_groups   = ["unicom.schedule_projector"]
  cert_common_name = "unicom/schedule"
}

module "unicom_es_connector" {
  source = "../../../modules/tls-app"
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
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1",
    "unicom.letter-status.1",
    "unicom.cost-calculated.1",
    "unicom.email-post-delivery.1",
    "unicom.go-inspire-letter-status.1",
    "unicom.cancel-status.1"
  ]
  consume_groups   = ["unicom.es_connector"]
  cert_common_name = "unicom/es_connector"
}

module "unicom_unit_sender_sms" {
  source = "../../../modules/tls-app"
  consume_topics = [
    "unicom.sms-released-critical.1",
    "unicom.sms-released-important.1",
    "unicom.sms-released.1"
  ]
  consume_groups = ["unicom.unit-sender-sms"]
  produce_topics = [
    "unicom.sms-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.rendered.1",
    "unicom.failed",
    "unicom.comms-fallback.1"
  ]
  cert_common_name = "unicom/unit_sender_sms"
}

module "unicom_outbound_call_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = ["unicom.outbound-call-request"]
  cert_common_name = "unicom/outbound_call_api"
}

module "unicom_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    "unicom.email-released-critical.1",
    "unicom.email-released-important.1",
    "unicom.email-released.1",
    "unicom.sms-released-critical.1",
    "unicom.sms-released-important.1",
    "unicom.sms-released.1",
    "unicom.scheduled.1",
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1",
    "unicom.cancellation.1",
  ]
  cert_common_name = "unicom/api"
}

module "unicom_outbound_calls_bq_connector" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.outbound-call-request"]
  consume_groups   = ["unicom.outbound-calls-bq-connector"]
  cert_common_name = "unicom/outbound_calls_bq_connector"
}

module "unicom_bq_connector" {
  source = "../../../modules/tls-app"
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
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1",
    "unicom.letter-status.1",
    "unicom.bounce.2019.1",
    "unicom.email-post-delivery.1",
    "unicom.rendered.1",
    "unicom.cost-calculated.1",
  ]
  consume_groups   = ["unicom.bq-connector"]
  cert_common_name = "unicom/bq_connector"
}

module "unicom_otc_letter_cancellation" {
  source           = "../../../modules/tls-app"
  consume_topics   = ["unicom.cancel-status.1"]
  consume_groups   = ["unicom.otc_letter_cancellation"]
  produce_topics   = ["unicom.cancel-status.1"]
  cert_common_name = "unicom/otc_letter_cancellation"
}

module "unicom_sqs_relay" {
  source = "../../../modules/tls-app"
  produce_topics = [
    "unicom.bounce.2019.1",
    "unicom.email-status.1",
    "unicom.email-post-delivery.1"
  ]
  cert_common_name = "unicom/sqs_relay"
}

module "unicom_tracking" {
  source = "../../../modules/tls-app"
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
    "unicom.email-post-delivery.1",
    "unicom.rendered.1",
    "unicom.cost-calculated.1",
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1",
    "unicom.letter-status.1",
  ]
  consume_groups = ["unicom.tracking"]
  produce_topics = [
    "unicom.status-v2",
    "unicom.status",
  ]
  cert_common_name = "unicom/tracking"
}

module "unicom_batch_sender" {
  source = "../../../modules/tls-app"
  consume_topics = [
    "unicom.letter-batch-critical.1",
    "unicom.letter-batch-important.1",
    "unicom.letter-batch.1"
  ]
  consume_groups = ["unicom.batch_sender"]
  produce_topics = [
    "unicom.letter-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.rendered.1",
    "unicom.failed",
    "unicom.comms-fallback.1"
  ]
  cert_common_name = "unicom/batch_sender"
}

module "unicom_filter_cancellation" {
  source = "../../../modules/tls-app"
  consume_topics = [
    "unicom.cancellation.1",
  ]
  consume_groups = [
    "unicom.filter_cancellation",
  ]
  produce_topics = [
    "unicom.scheduled.1",
    "unicom.cancel-status.1"
  ]
  cert_common_name = "unicom/filter_cancellation"
}

module "unicom_unit_sender_letter_otc" {
  source = "../../../modules/tls-app"
  consume_topics = [
    "unicom.letter-released-critical.1",
    "unicom.letter-released-important.1",
    "unicom.letter-released.1"
  ]
  consume_groups = ["unicom.unit-sender-letter-otc"]
  produce_topics = [
    "unicom.letter-status.1",
    "unicom.tests",
    "unicom.cost-calculated.1",
    "unicom.rendered.1",
    "unicom.failed",
    "unicom.comms-fallback.1"
  ]
  cert_common_name = "unicom/unit_sender_letter_otc"
}

module "unicom_external_comms_api" {
  source = "../../../modules/tls-app"
  produce_topics = [
    "unicom.status",
    "unicom.status-v2",
  ]
  cert_common_name = "unicom/external_comms_api"
}
