terraform {
  backend "s3" {
    bucket = "uw-prod-pubsub-tf-applier-state"
    # tflint-ignore: msk_module_backend
    key     = "prod-aws/sys-msk-exp-pubsub"
    region  = "eu-west-1"
    encrypt = true
  }
}
