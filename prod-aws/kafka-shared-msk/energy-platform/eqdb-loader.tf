resource "kafka_topic" "eqdb_loader_service" {
  name               = "energy-platform.eqdb-loader.service"
  replication_factor = 3
  partitions         = 1
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data for 1 week
    "retention.ms" = "604800000"
    # keep data in primary storage for 2 days
    "local.retention.ms" = "172800000"
    # allow for a batch of records maximum 1MiB
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "eqdb_loader_service" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.eqdb_loader_service.name]
  cert_common_name = "energy-platform/eqdb-loader.service"
}

module "service_fabricator" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.eqdb_loader_service.name]
  consume_groups   = ["energy-platform.service-fabrication"]
  cert_common_name = "energy-platform/service-fabrication"
}
