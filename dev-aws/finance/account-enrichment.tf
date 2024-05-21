resource "kafka_topic" "account_enrichment_events" {
  name               = "account-enrichment.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "account_enrichment_eqdb_loader_customer_events" {
  name               = "account-enrichment.eqdb-loader.customer.events"
  replication_factor = 3
  partitions         = 1
  config = {
    "retention.bytes" = "-1"
    "retention.ms"    = "2592000000"
    "cleanup.policy"  = "delete"
  }
}
