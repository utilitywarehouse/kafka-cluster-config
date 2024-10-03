terraform {
  backend "s3" {
    bucket  = "uw-prod-pubsub-tf-applier-state"
    key     = "prod-aws/kafka-shared-msk-workplace-infrastructure"
    region  = "eu-west-1"
    encrypt = true
  }
}
