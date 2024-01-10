resource "kafka_topic" "account_balance_diff_events" {
  name               = "account-balance-diff.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
  }
}

resource "kafka_topic" "sledger_eqdb_loader_events" {
  name               = "sledger-eqdb-loader.events"
  replication_factor = 3
  partitions         = 10
  config = {
    "cleanup.policy"  = "delete"
    "max.message.bytes" = "104857600"
    "max.retention.bytes" = "-1"
    "max.retention.ms" = "-1"
  }
}


# resource "kafka_topic" "dd_run_events" {
#   name               = "dd-run.events"
#   replication_factor = 3
#   partitions         = 10
#   config = {
#     "retention.bytes" = "-1"
#     "retention.ms"    = "604800000" #7 days
#     "cleanup.policy"  = "delete"
#   }
# }

# resource "kafka_topic" "iam_cerbos_audit_v1" {
#   name               = "auth.iam-cerbos-audit-v1"
#   replication_factor = 3
#   partitions         = 10
#   config = {
#     # retain 100MB on each partition
#     "retention.bytes" = "104857600"
#     # keep data for 2 days
#     "retention.ms" = "172800000"
#     # allow max 1 MB for a message
#     "max.message.bytes" = "1048576"
#     "compression.type" = "zstd"
#     "cleanup.policy"   = "delete"
#   }
# }