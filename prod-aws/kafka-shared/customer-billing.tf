resource "kafka_topic" "invoice_fulfillment" {
  name               = "bex.internal.bill_fulfilled"
  replication_factor = 3
  partitions         = 10
  config             = {
    # keep data for 7 days
    "retention.ms"      = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_topic" "invoice_fulfillment_deadletter" {
  name               = "bex.internal.accountreadytobefulfilled_deadletter"
  replication_factor = 3
  partitions         = 10
  config             = {
    # keep data for 14 days
    "retention.ms"      = "1209600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "invoice_fulfillment" {
  source           = "../../modules/tls-app"
  cert_common_name = "customer-billing/invoice-fulfillment"
  produce_topics   = [kafka_topic.invoice_fulfillment.name, kafka_topic.invoice_fulfillment_deadletter.name]
}

module "bills_total_api" {
  source           = "../../modules/tls-app"
  cert_common_name = "customer-billing/bills-total-api"
  consume_topics   = { (kafka_topic.invoice_fulfillment.name) : "bex.bills-total-api-reader" }
}

moved {
  from = module.invoice_fulfillment_deadletter_producer.kafka_acl.producer_acl
  to   = module.invoice_fulfillment.kafka_acl.producer_acl["bex.internal.accountreadytobefulfilled_deadletter"]
}

moved {
  from = module.invoice_fulfillment_producer.kafka_acl.producer_acl
  to   = module.invoice_fulfillment.kafka_acl.producer_acl["bex.internal.bill_fulfilled"]
}

moved {
  from = module.invoice_fulfillment_producer.kafka_quota.producer_quota
  to   = module.invoice_fulfillment.kafka_quota.quota
}

moved {
  from = module.bills_total_api_consumer.kafka_acl.topic_acl
  to   = module.bills_total_api.kafka_acl.topic_acl["bex.internal.bill_fulfilled"]
}

moved {
  from = module.bills_total_api_consumer.kafka_acl.group_acl
  to   = module.bills_total_api.kafka_acl.group_acl["bex.internal.bill_fulfilled"]
}

moved {
  from = module.bills_total_api_consumer.kafka_quota.consumer_quota
  to   = module.bills_total_api.kafka_quota.quota
}
