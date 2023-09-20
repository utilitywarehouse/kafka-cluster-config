resource "kafka_topic" "invoice_fulfillment" {
  name               = "bex.internal.bill_fulfilled"
  replication_factor = 3
  partitions         = 10
  config = {
    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type" = "zstd"
    "cleanup.policy"   = "delete"
  }
}

module "invoice_fulfillment_producer" {
  source = "git@github.com:utilitywarehouse/kafka-cluster-config//modules/producer"

  topic = kafka_topic.invoice_fulfillment.name

  cert_common_name = "customer-billing/invoice-fulfillment"
}
