resource "kafka_topic" "dev_enablement_pilotcd_v1" {
  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data for 7 days
    "retention.ms" = "604800000"
  }
  name               = "dev-enablement.pilotcd.v1"
  partitions         = 5
  replication_factor = 3
}

module "dev_enablement_pilotcd_api" {
  source           = "../../../modules/tls-app"
  produce_topics   = [kafka_topic.dev_enablement_pilotcd_v1.name]
  cert_common_name = "dev-enablement/pilotcd-api"
}

module "dev_enablement_pilotcd_worker" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.dev_enablement_pilotcd_v1.name]
  consume_groups   = ["dev-enablement.pilotcd.worker"]
  cert_common_name = "dev-enablement/pilotcd-worker"
}
