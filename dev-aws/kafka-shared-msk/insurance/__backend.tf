terraform {
  backend "s3" {
    bucket  = "uw-dev-pubsub-tf-applier-state"
    key     = "dev-aws/kafka-shared-msk-insurance"
    region  = "eu-west-1"
    encrypt = true
  }
}
