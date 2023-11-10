resource "kafka_topic" "invoice_fulfillment" {
  name               = "bex.internal.bill_fulfilled"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "invoice_fulfillment_producer" {
  source = "../../modules/producer"

  topic = kafka_topic.invoice_fulfillment.name

  cert_common_name = "customer-billing/invoice-fulfillment"
}

module "bills_total_api_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.invoice_fulfillment.name
  consumer_group = "bills-total-api-reader"

  cert_common_name = "customer-billing/bills-total-api"
}

resource "kafka_topic" "invoice_fulfillment_deadletter" {
  name               = "bex.internal.accountreadytobefulfilled_deadletter"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep data for 14 days
    "retention.ms" = "1209600000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "invoice_fulfillment_producer" {
  source = "../../modules/producer"

  topic = kafka_topic.invoice_fulfillment_deadletter.name

  cert_common_name = "customer-billing/invoice-fulfillment"
}

module "invoice_fulfillment_consumer" {
  source = "../../modules/consumer"

  topic          = kafka_topic.invoice_fulfillment_deadletter.name
  consumer_group = "bills-total-api-reader"

  cert_common_name = "customer-billing/invoice-fulfillment"
}
