terraform {
  required_providers {
    kafka = {
      source  = "Mongey/kafka"
      version = ">= 0.7.0"
    }
  }
}

provider "kafka" {
  bootstrap_servers = [
    "kafka-bitnami-0.kafka-bitnami-headless.finance.svc.cluster.aws:9092",
    "kafka-bitnami-1.kafka-bitnami-headless.finance.svc.cluster.aws:9092",
    "kafka-bitnami-2.kafka-bitnami-headless.finance.svc.cluster.aws:9092",
  ]
  tls_enabled = false
}
