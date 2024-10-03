terraform {
  backend "s3" {
    bucket  = "uw-prod-pubsub-tf-applier-state"
    key     = "prod-aws/kafka-shared-msk-cbc"
    region  = "eu-west-1"
    encrypt = true
  }
}
