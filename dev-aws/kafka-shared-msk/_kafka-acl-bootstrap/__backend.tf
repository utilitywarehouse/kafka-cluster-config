terraform {
  backend "s3" {
    bucket = "uw-dev-pubsub-tf-applier-state"
    # tflint-ignore: msk_module_backend
    key     = "dev-aws/sys-msk-exp-kafka-acl-bootstrap"
    region  = "eu-west-1"
    encrypt = true
  }
}
