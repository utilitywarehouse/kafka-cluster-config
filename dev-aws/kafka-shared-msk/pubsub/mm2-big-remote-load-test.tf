resource "kafka_topic" "mm2_remote_load_test" {
  name               = "pubsub.mm2-load-test"
  replication_factor = 3
  partitions         = 5
  config = {
    # Use tiered storage
    "remote.storage.enable" = "true"
    # retain 20GB on each partition, in total 100GB
    "retention.bytes" = "21474836480"
    # retain in local only 10MB to force moving to the remote once the log segment is rolled.
    "local.retention.bytes" = "10485760"

    # keep data for 7 days
    "retention.ms" = "604800000"
    # allow max 1 MB for a message
    "max.message.bytes" = "1048576"
    "compression.type"  = "zstd"
    "cleanup.policy"    = "delete"
  }
}

resource "kafka_acl" "mirror_maker_load_test_topic_access" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/mirror-maker-load-test"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "mirror_maker_load_test_group_access" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/mirror-maker-load-test"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "mirror_maker_load_test_cluster_access" {
  resource_name                = "kafka-cluster"
  resource_type                = "Cluster"
  acl_principal                = "User:CN=pubsub/mirror-maker-load-test"
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}

resource "kafka_quota" "quota" {
  entity_name = "User:CN=pubsub/mirror-maker-load-test"
  entity_type = "user"
  config = {
    # produce with 500 KB/broker
    "producer_byte_rate" = "512000"
    "request_percentage" = "100"
  }
}
