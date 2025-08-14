terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kafka = {
      source  = "Mongey/kafka"
      version = ">= 0.7.0"
    }
  }
}

provider "kafka" {
  bootstrap_servers = [
    "b-1.sysmskexp.6pgyqr.c8.kafka.eu-west-1.amazonaws.com:9092",
    "b-2.sysmskexp.6pgyqr.c8.kafka.eu-west-1.amazonaws.com:9092",
    "b-3.sysmskexp.6pgyqr.c8.kafka.eu-west-1.amazonaws.com:9092",
  ]
}
