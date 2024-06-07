resource "kafka_topic" "workplace_infrastructure_netapp_audit_v1" {
  name = "workplace-infrastructure.netapp-audit-v1"
  replication_factor = 3
  partitions = 10
  config = {
    "retention.bytes"   = "209715200"  # 200 MiB/Partition
    "retention.ms"      = "86400000"   # 1 day
    "max.message.bytes" = "8192"       # 8 kiB/Message
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

module "workplace_infrastructure_netapp_audit_publish_to_kafka" {
  source           = "../../../modules/tls-app"
  consume_topics   = [kafka_topic.workplace_infrastructure.netapp-audit-v1.name]
  consume_groups   = ["workplace_infrastructure.netapp-audit-v1-consumer"]
  produce_topics   = [kafka_topic.workplace_infrastructure.netapp-audit-v1.name]
  cert_common_name = "workplace-infrastructure/netapp_audit_publish_to_kafka"
}
