# Grant pubsub/tf-kafka-config-admin permission to all the resources
resource "kafka_acl" "tf_kafka_config_admin_topic" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/tf-kafka-config-admin"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "tf_kafka_config_admin_group" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/tf-kafka-config-admin"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "tf_kafka_config_admin_cluster" {
  resource_name                = "kafka-cluster"
  resource_type                = "Cluster"
  acl_principal                = "User:CN=pubsub/tf-kafka-config-admin"
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}
