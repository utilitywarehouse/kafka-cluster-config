resource "kafka_acl" "kafka_ui_topic" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/sys-msk-exp-kafka-ui"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

# Deny topic delete to kafka-ui to prevent data loss. Only tf-kafka-config-admin will be able to delete topics in prod manually
resource "kafka_acl" "kafka_ui_topic_deny_delete" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/sys-msk-exp-kafka-ui"
  acl_host            = "*"
  acl_operation       = "Delete"
  acl_permission_type = "Deny"
}

resource "kafka_acl" "kafka_ui_group" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/sys-msk-exp-kafka-ui"
  acl_host            = "*"
  acl_operation       = "All"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_ui_cluster" {
  resource_name                = "kafka-cluster"
  resource_type                = "Cluster"
  acl_principal                = "User:CN=pubsub/sys-msk-exp-kafka-ui"
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"

}
