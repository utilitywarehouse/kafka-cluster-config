resource "kafka_acl" "kafka_ui" {
  resource_name       = "*"
  resource_type       = "*"
  acl_principal       = "User:CN=pubsub/kafka-ui"
  acl_host            = "*"
  acl_operation       = "*"
  acl_permission_type = "Allow"
}
