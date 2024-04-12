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
    "kafka-shared-0.kafka-shared-headless.pubsub.svc.cluster.merit:9092",
    "kafka-shared-1.kafka-shared-headless.pubsub.svc.cluster.merit:9092",
    "kafka-shared-2.kafka-shared-headless.pubsub.svc.cluster.merit:9092",
  ]
}
