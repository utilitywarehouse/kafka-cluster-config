terraform {
  backend "s3" {
    bucket  = "uw-dev-account-platform-kafka-tf-state"
    key     = "dev-aws/kafka-shared"
    encrypt = true
    region  = "eu-west-1"
  }
}
