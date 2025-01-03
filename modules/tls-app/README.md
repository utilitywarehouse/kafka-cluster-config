# TLS app Terraform module

This module defines the ACLs and quota needed by an app to communicate with an mTLS enabled kafka cluster.

See [main.tf](main.tf) for what resources it defines and [variables.tf](variables.tf) for available input variables.

## Usage example:
Following the [name prefix guidelines](../../prod-aws/kafka-shared/README.md#contributing):

```terraform
module "example" {
  source           = "../../modules/tls-app"
  consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
  consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
  produce_topics   = ["dev-enablement.example-produce-topic"]
  cert_common_name = "dev-enablement/example-app"
}
```

The module will define a `user_name` output that can be used to define a
[`kafka_quota`](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/quota):

```terraform
resource "kafka_quota" "example_quota" {
  entity_name = module.example.user_name
  entity_type = "user"
  config = {
    "consumer_byte_rate" = 3145728 # limit consuming to 3 MiB/s
    "producer_byte_rate" = 4194304 # limit producing to 4 MiB/s
  }
}
```
