terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.14.0"
    }
  }

  backend "s3" {
    bucket = "uw-dev-pubsub-tf-applier-state"
    # tflint-ignore: msk_module_backend
    key     = "dev-aws/msk-backup-bucket-retention"
    region  = "eu-west-1"
    encrypt = true
  }
}

provider "aws" {
  region  = "eu-west-1"
}
