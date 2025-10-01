terraform {
  backend "s3" {
    bucket  = "uw-dev-pubsub-tf-applier-state"
    key     = "dev-aws/sys-msk-exp"
    region  = "eu-west-1"
    encrypt = true
  }
}
