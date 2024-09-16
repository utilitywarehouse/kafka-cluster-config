resource "kafka_topic" "di_eqdbloader_schedule" {
  name               = "data-infra.eqdb-loader.schedule"
  replication_factor = 3
  partitions         = 1
  config = {
    "remote.storage.enable" = "false"
    # 1 day
    "local.retention.ms" = "86400000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "di_eqdbloader_scheduler" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.di_eqdbloader_schedule.name,
  ]
  cert_common_name = "data-infra/di-eqdbloader-scheduler"
}

module "di_eqdbloader_writer" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.di_eqdbloader_schedule.name,
  ]
  consume_groups = [
    "data-infra.di-eqdbloader-writer",
  ]

  cert_common_name = "data-infra/di-eqdbloader-writer"
}
