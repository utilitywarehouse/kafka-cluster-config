# kafka-exporter ACLs
# Using resourceType = "Any" triggers kafka to complain:
# `java.lang.IllegalArgumentException: resourceType must not be ANY`
# Looks like we'd have to create ACLs per resource type
resource "kafka_acl" "kafka_exporter_topic" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/kafka-exporter"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_exporter_group" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/kafka-exporter"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_exporter_cluster" {
  resource_name       = "*"
  resource_type       = "Cluster"
  acl_principal       = "User:CN=pubsub/kafka-exporter"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka_exporter_transactional_id" {
  resource_name       = "*"
  resource_type       = "TransactionalID"
  acl_principal       = "User:CN=pubsub/kafka-exporter"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}
