# Consumers
resource "kafka_acl" "topic_acl" {
  for_each            = var.consume_topics
  resource_name       = each.key
  resource_type       = "Topic"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "group_acl" {
  for_each            = var.consume_topics
  resource_name       = each.value
  resource_type       = "Group"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

# Producers
resource "kafka_acl" "producer_acl" {
  for_each            = toset(var.produce_topics)
  resource_name       = each.key
  resource_type       = "Topic"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

# Quota
resource "kafka_quota" "quota" {
  entity_name = "User:CN=${var.cert_common_name}"
  entity_type = "user"
  config = {
    "consumer_byte_rate" = tostring(var.consumer_byte_rate)
    "producer_byte_rate" = tostring(var.producer_byte_rate)
    "request_percentage" = tostring(var.request_percentage)
  }
}
