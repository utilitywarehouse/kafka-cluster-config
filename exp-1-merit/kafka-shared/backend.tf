terraform {
  backend "s3" {
    bucket = "uw-dev-system-pubsub-tf-state-exp-1"
    key    = "exp-1-merit/kafka-shared"
    region = "eu-west-1"
  }
}
