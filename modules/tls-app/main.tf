locals {
  user_name = "CN=${var.cert_common_name}"
}

output "user_name" {
  value       = local.user_name
  description = "The name of the user permitted to consume/produce on the topic"
}

# For each consumed topic define an ACL for reading that topic
resource "kafka_acl" "topic_acl" {
  for_each            = toset(var.consume_topics)
  resource_name       = each.value
  resource_type       = "Topic"
  acl_principal       = "User:${local.user_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

# For each used consumer group define an ACL for accessing it
resource "kafka_acl" "group_acl" {
  for_each            = toset(var.consume_groups)
  resource_name       = each.key
  resource_type       = "Group"
  acl_principal       = "User:${local.user_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

# For each produce topic define a write ACL for that topic
resource "kafka_acl" "producer_acl" {
  for_each            = toset(var.produce_topics)
  resource_name       = each.key
  resource_type       = "Topic"
  acl_principal       = "User:${local.user_name}"
  acl_host            = var.acl_host
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}
