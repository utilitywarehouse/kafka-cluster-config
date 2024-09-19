module "es_topic_indexer" {
  source           = "../../../modules/tls-app"
  cert_common_name = "crm/msk-topic-indexer"
  consume_topics   = [(kafka_topic.vulnerability_v7.name)]
  consume_groups   = ["customer-support.topic-indexer"]
}
