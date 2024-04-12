terraform {

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
    "kafka-shared-0.kafka-shared-headless.pubsub.svc.cluster.aws:9092",
    "kafka-shared-1.kafka-shared-headless.pubsub.svc.cluster.aws:9092",
    "kafka-shared-2.kafka-shared-headless.pubsub.svc.cluster.aws:9092",
  ]
}
