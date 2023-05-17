resource "kafka_acl" "kafka_exporter" {
  resource_name       = "*"
  resource_type       = "Any"
  acl_principal       = "User:CN=pubsub/kafka-exporter"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}
