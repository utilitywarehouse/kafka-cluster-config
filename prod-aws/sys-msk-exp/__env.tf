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
    "b-1.sysmskexp.402ohe.c5.kafka.eu-west-1.amazonaws.com:9094",
    "b-2.sysmskexp.402ohe.c5.kafka.eu-west-1.amazonaws.com:9094",
    "b-3.sysmskexp.402ohe.c5.kafka.eu-west-1.amazonaws.com:9094",
  ]
}
