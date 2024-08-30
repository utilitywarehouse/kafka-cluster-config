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
    "broker-0.broker.account-platform.svc.cluster.merit:9092",
    "broker-1.broker.account-platform.svc.cluster.merit:9092",
    "broker-2.broker.account-platform.svc.cluster.merit:9092",
    "broker-3.broker.account-platform.svc.cluster.merit:9092",
    "broker-4.broker.account-platform.svc.cluster.merit:9092"
  ]
  tls_enabled = false
}
