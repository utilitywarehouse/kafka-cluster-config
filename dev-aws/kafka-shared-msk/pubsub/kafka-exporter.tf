# kafka-exporter ACLs
# Using resourceType = "Any" triggers kafka to complain:
# `java.lang.IllegalArgumentException: resourceType must not be ANY`
# Looks like we'd have to create ACLs per resource type
# We should need the following according to:
# https://github.com/danielqsj/kafka_exporter/issues/40#issuecomment-832122188
resource "kafka_acl" "kafka_exporter_topic" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/msk-exporter"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_exporter_group" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/msk-exporter"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}
