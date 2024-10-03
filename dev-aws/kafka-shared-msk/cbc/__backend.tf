terraform {
  backend "s3" {
    bucket  = "uw-dev-pubsub-tf-applier-state"
    key     = "dev-aws/kafka-shared-msk-cbc"
    region  = "eu-west-1"
    encrypt = true
  }
}
