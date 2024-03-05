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
    "b-1.devenablementpubsubmsk.mw71ue.c2.kafka.eu-west-1.amazonaws.com:9094",
    "b-2.devenablementpubsubmsk.mw71ue.c2.kafka.eu-west-1.amazonaws.com:9094",
    "b-3.devenablementpubsubmsk.mw71ue.c2.kafka.eu-west-1.amazonaws.com:9094",
  ]
}
