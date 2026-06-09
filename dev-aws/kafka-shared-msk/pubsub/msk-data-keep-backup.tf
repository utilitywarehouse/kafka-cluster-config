resource "kafka_acl" "msk_data_keep_backup_read_topic_all" {
  resource_name       = "*"
  resource_type       = "Topic"
  acl_principal       = "User:CN=pubsub/msk-data-keep-backup"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "msk_data_keep_backup_describe_group_all" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = "User:CN=pubsub/msk-data-keep-backup"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

module "msk_data_keep_backup" {
  source           = "../../../modules/tls-app"
  consume_groups   = ["pubsub.msk-data-keep-backup"]
  cert_common_name = "pubsub/msk-data-keep-backup"
}
