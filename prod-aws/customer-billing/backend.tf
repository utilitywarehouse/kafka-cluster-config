terraform {
  backend "s3" {
    bucket = "uw-prod-customer-billing-kafka-tf-state"
    key    = "prod-aws/kafka-shared"
    region = "eu-west-1"
  }
}
