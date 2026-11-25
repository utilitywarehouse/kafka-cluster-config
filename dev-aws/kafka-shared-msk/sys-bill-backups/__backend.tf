terraform {
  backend "s3" {
    bucket  = "uw-dev-pubsub-tf-applier-state"
    key     = "dev-aws/kafka-shared-msk-sys-bill-backups"
    region  = "eu-west-1"
    encrypt = true
  }
}
