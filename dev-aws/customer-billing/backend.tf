terraform {
  backend "s3" {
    bucket = "uw-dev-customer-billing-kafka-tf-state"
    key    = "dev-aws/kafka-shared"
    region = "eu-west-1"
  }
}
