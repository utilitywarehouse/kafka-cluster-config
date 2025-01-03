module "es_topic_indexer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/msk-topic-indexer"
  consume_topics = [
    kafka_topic.notes_v2.name,
    kafka_topic.payments_audit_log_v1.name,
    kafka_topic.reminders_v1.name,
    kafka_topic.ticketing_v2.name,
    kafka_topic.vulnerability_v6.name
  ]
  consume_groups = ["customer-support.topic-indexer"]
}
