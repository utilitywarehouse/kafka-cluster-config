# For each consumed topic define an ACL for reading that topic
resource "kafka_acl" "topic_acl" {
  for_each            = toset(var.consume_topics)
  resource_name       = each.value
  resource_type       = "Topic"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

# For each consumed topic define an ACL for accessing the consumer group
resource "kafka_acl" "group_acl" {
  for_each            = toset(var.consume_groups)
  resource_name       = each.key
  resource_type       = "Group"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

# For each produce topic define a write ACL for that topic
resource "kafka_acl" "producer_acl" {
  for_each            = toset(var.produce_topics)
  resource_name       = each.key
  resource_type       = "Topic"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

# Define a single quota for the user
resource "kafka_quota" "quota" {
  entity_name = "User:CN=${var.cert_common_name}"
  entity_type = "user"
  config = {
    "consumer_byte_rate" = tostring(var.consumer_byte_rate)
    "producer_byte_rate" = tostring(var.producer_byte_rate)
    "request_percentage" = tostring(var.request_percentage)
  }
}
