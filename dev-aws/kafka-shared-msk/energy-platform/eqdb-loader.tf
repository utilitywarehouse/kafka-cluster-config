resource "kafka_topic" "eqdb_loader_service" {
  name               = "energy-platform.eqdb-loader.service"
  replication_factor = 3
  partitions         = 1
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms" = "64800000"
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
