terraform {
  backend "s3" {
    bucket = "uw-prod-finance-pubsub-tf-state"
    key    = "prod-aws/kafka-shared"
    region = "eu-west-1"
  }
}
