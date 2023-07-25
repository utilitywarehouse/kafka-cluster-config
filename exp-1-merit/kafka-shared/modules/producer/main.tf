resource "kafka_acl" "producer_acl" {
  resource_name       = var.topic
  resource_type       = "Topic"
  acl_principal       = "User:CN=${var.cert_common_name}"
  acl_host            = var.acl_host
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_quota" "producer_quota" {
  entity_name = "User:CN=${var.cert_common_name}"
  entity_type = "user"
  config = {
    "producer_byte_rate" = tostring(var.producer_byte_rate)
    "request_percentage" = tostring(var.request_percentage)
  }
}
