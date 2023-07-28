resource "kafka_acl" "topic_acl" {
  resource_name       = var.topic
  resource_type       = "Topic"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "group_acl" {
  resource_name       = var.consumer_group
  resource_type       = "Group"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "consumer_quota" {
  entity_name = "User:CN=${var.cert_common_name}"
  entity_type = "user"
  config = {
    "consumer_byte_rate" = tostring(var.consumer_byte_rate)
    "request_percentage" = tostring(var.request_percentage)
  }
}
