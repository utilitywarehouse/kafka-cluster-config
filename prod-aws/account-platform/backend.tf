terraform {
  backend "s3" {
    bucket  = "uw-prod-account-platform-kafka-tf-state"
    key     = "prod-aws/kafka-shared"
    encrypt = true
    region  = "eu-west-1"
  }
}
