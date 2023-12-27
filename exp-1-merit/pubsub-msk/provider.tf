terraform {
  required_providers {
    kafka = {
      source = "Mongey/kafka"
    }
  }
}

provider "kafka" {
  bootstrap_servers = [
    "msk-0.pubsub.svc.cluster.merit:9094",
    "msk-1.pubsub.svc.cluster.merit:9094",
    "msk-2.pubsub.svc.cluster.merit:9094",
  ]
}
