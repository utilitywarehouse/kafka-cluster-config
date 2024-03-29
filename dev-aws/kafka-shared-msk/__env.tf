terraform {
  backend "s3" {}

  required_providers {
    kafka = {
      source = "Mongey/kafka"
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
