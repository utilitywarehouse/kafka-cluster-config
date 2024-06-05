# Produce to contact-channels.article_feedback_v1
module "article_feedback_publisher" {
  source           = "../../../modules/tls-app"
  cert_common_name = "digital-support/article-feedback-publisher"
  produce_topics   = [kafka_topic.article_feedback_v1.name]
}
