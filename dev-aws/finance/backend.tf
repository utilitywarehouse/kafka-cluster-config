terraform {
  backend "s3" {
    bucket = "uw-dev-finance-pubsub-tf-state"
    key    = "dev-aws/kafka-shared"
    region = "eu-west-1"
  }
}