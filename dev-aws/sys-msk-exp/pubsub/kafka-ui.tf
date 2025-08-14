resource "kafka_acl" "kafka_ui_topic" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/kafka-ui"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_ui_group" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/kafka-ui"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_ui_cluster" {
  resource_name                = "kafka-cluster"
  resource_type                = "Cluster"
  acl_principal                = "User:CN=pubsub/kafka-ui"
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}
