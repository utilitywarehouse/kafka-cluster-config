terraform {
  backend "s3" {
    bucket = "uw-dev-pubsub-tf-applier-state"
    # tflint-ignore: msk_module_backend
    key     = "dev-aws/kafka-shared-msk-kafka-acl-bootstrap"
    region  = "eu-west-1"
    encrypt = true
  }
}
