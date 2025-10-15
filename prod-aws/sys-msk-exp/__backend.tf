terraform {
  backend "s3" {
    bucket  = "uw-prod-pubsub-tf-applier-state"
    key     = "prod-aws/sys-msk-exp"
    region  = "eu-west-1"
    encrypt = true
  }
}
