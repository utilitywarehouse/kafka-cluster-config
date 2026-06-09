resource "kafka_acl" "brokers_topic" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=*.devenablementpubsubmsk.mw71ue.c2.kafka.eu-west-1.amazonaws.com"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "brokers_group" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=*.devenablementpubsubmsk.mw71ue.c2.kafka.eu-west-1.amazonaws.com"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}
