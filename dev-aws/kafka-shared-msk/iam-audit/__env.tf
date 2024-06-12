terraform {
  required_version = ">= 1.5.0"

  backend "s3" {}

  required_providers {
    kafka = {
      source  = "Mongey/kafka"
      version = ">= 0.7.0"
    }
  }
}

provider "kafka" {
  bootstrap_servers = [
    "b-1.devenablementpubsubmsk.xmhf7r.c8.kafka.eu-west-1.amazonaws.com:9094",
    "b-2.devenablementpubsubmsk.xmhf7r.c8.kafka.eu-west-1.amazonaws.com:9094",
    "b-3.devenablementpubsubmsk.xmhf7r.c8.kafka.eu-west-1.amazonaws.com:9094",
  ]
}
