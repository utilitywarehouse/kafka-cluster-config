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
    "broker-0.broker.customer-support.svc.cluster.aws:9092",
    "broker-1.broker.customer-support.svc.cluster.aws:9092",
    "broker-2.broker.customer-support.svc.cluster.aws:9092",
    "broker-3.broker.customer-support.svc.cluster.aws:9092",
    "broker-4.broker.customer-support.svc.cluster.aws:9092"
  ]
  tls_enabled = false
}
