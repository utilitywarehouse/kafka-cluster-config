terraform {
  required_providers {
    kafka = {
      source = "Mongey/kafka"
    }
  }
}

provider "kafka" {
  bootstrap_servers = [
    "b-1.devenablementpubsubmsk.2ssj7n.c8.kafka.eu-west-1.amazonaws.com:9094",
    "b-2.devenablementpubsubmsk.2ssj7n.c8.kafka.eu-west-1.amazonaws.com:9094",
    "b-3.devenablementpubsubmsk.2ssj7n.c8.kafka.eu-west-1.amazonaws.com:9094",
  ]
}
