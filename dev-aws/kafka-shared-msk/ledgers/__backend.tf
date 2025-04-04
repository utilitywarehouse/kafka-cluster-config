terraform {
  backend "s3" {
    bucket  = "uw-dev-pubsub-tf-applier-state"
    key     = "dev-aws/kafka-shared-msk-ledgers"
    region  = "eu-west-1"
    encrypt = true
  }
}
