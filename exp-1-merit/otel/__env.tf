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
    "kafka-bitnami-0.kafka-bitnami-headless.otel.svc.cluster.merit:9092",
    "kafka-bitnami-1.kafka-bitnami-headless.otel.svc.cluster.merit:9092",
    "kafka-bitnami-2.kafka-bitnami-headless.otel.svc.cluster.merit:9092",
  ]
}
