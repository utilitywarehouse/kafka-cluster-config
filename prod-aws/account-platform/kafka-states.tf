module "account-platform_tf_state" {
  source = "github.com/utilitywarehouse/system-terraform-modules//aws_bucket?ref=c4c8afd"
  name   = "kafka-tf-state"
}

output "account-platform_tf_state_bucket" {
  value = module.account-platform_tf_state.bucket
}

module "access_role" {
  source       = "github.com/utilitywarehouse/system-terraform-modules//aws_bucket_access?ref=c4c8afd"
  bucket_id    = module.account-platform_tf_state.bucket.id
  write_access = true
}

output "role" {
  value = module.access_role.role
}
