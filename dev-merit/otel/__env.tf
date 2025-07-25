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
    "kafka-controller-0.kafka-controller-headless.otel.svc.cluster.merit:9092",
    "kafka-controller-1.kafka-controller-headless.otel.svc.cluster.merit:9092",
    "kafka-controller-2.kafka-controller-headless.otel.svc.cluster.merit:9092",
  ]
}
