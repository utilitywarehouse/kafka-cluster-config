resource "kafka_acl" "mirror_maker_topic_access" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/mirror-maker"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "mirror_maker_group_access" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/mirror-maker"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "mirror_maker_cluster_access" {
  resource_name                = "kafka-cluster"
  resource_type                = "Cluster"
  acl_principal                = "User:CN=pubsub/mirror-maker"
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"

  depends_on = [kafka_acl.tf_applier_cluster]
}

resource "kafka_quota" "mirror_maker_quota" {
  entity_name = "User:CN=pubsub/mirror-maker"
  entity_type = "user"
  config = {
    # limit producing to 5 MB/s/broker
    "producer_byte_rate" = "5242880"

    # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
    "request_percentage" = "100"
  }
}
