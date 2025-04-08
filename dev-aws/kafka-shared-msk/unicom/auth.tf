    module "unicom_caps_consent_projector" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/caps_consent_projector"
  }
    
    module "unicom_1132_unit_sender_letter_go_inspire" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_letter_go_inspire"
  }
    
    module "unicom_1132_unit_sender_email" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_email"
  }
    
    module "unicom_1170_mock_clx_report" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1170_mock_clx_report"
  }
    
    module "unicom_1070_bounce_projector" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1070_bounce_projector"
  }
    
    module "unicom_1150_tracking_v2" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1150_tracking_v2"
  }
    
    module "unicom_comms_fallback_sender" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/comms_fallback_sender"
  }
    
    module "unicom_1132_unit_sender_push_notification" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_push_notification"
  }
    
    module "unicom_9201_failed_retrigger" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/9201_failed_retrigger"
  }
    
    module "unicom_2022_rendered_letter_fabricator" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/2022_rendered_letter_fabricator"
  }
    
    module "unicom_1134_batch_projector" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1134_batch_projector"
  }
    
    module "unicom_1193_otc_reporting_webhook" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1193_otc_reporting_webhook"
  }
    
    module "unicom_1160_clx_report" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1160_clx_report"
  }
    
    module "unicom_consumer" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/consumer"
  }
    
    module "unicom_1132_unit_sender_letter_stannp" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_letter_stannp"
  }
    
    module "unicom_1135_batch_releaser" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1135_batch_releaser"
  }
    
    module "unicom_1190_router" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1190_router"
  }
    
    module "unicom_1120_ses_mock" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1120_ses_mock"
  }
    
    module "unicom_1195_stannp_reporting" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1195_stannp_reporting"
  }
    
    module "unicom_1141_schedule" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1141_schedule"
  }
    
    module "unicom_1090_es_connector" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1090_es_connector"
  }
    
    module "unicom_1132_unit_sender_sms" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_sms"
  }
    
    module "unicom_outbound_call_api" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/outbound_call_api"
  }
    
    module "unicom_1001_api" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1001_api"
  }
    
    module "unicom_outbound_calls_bq_connector" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/outbound_calls_bq_connector"
  }
    
    module "unicom_1020_bq_connector" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1020_bq_connector"
  }
    
    module "unicom_1194_otc_letter_cancellation" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1194_otc_letter_cancellation"
  }
    
    module "unicom_1060_sqs_relay" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1060_sqs_relay"
  }
    
    module "unicom_1132_unit_sender_letter_otc" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_letter_otc"
  }
    
    module "unicom_1132_unit_sender_email_mock" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_email_mock"
  }
    
    module "unicom_consumer_api" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/consumer_api"
  }
    
    module "unicom_1121_probe" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1121_probe"
  }
    
    module "unicom_1150_tracking" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1150_tracking"
  }
    
    module "unicom_1132_unit_sender_letter" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1132_unit_sender_letter"
  }
    
    module "unicom_1133_batch_sender" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1133_batch_sender"
  }
    
    module "unicom_1010_filter_cancellation" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/1010_filter_cancellation"
  }
    
    module "unicom_external_comms_api" {
    source           = "../../../modules/tls-app"
    consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
    consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
    produce_topics   = ["dev-enablement.example-produce-topic"]
    cert_common_name = "unicom/external_comms_api"
  }