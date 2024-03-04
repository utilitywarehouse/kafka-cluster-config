# TLS app Terraform module

This module defines the ACLs and quota needed by an app to communicate with an mTLS enabled kafka cluster.

See [main.tf](main.tf) for what resources it defines and [variables.tf](variables.tf) for available input variables.

## Usage example:
Following the [name prefix guidelines](../../prod-aws/kafka-shared/README.md#contributing):
1. using default quota values:
     ```terraform
     module "example" {
       source           = "../../modules/tls-app"
       consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
       consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
       produce_topics   = ["dev-enablement.example-produce-topic"]
       cert_common_name = "dev-enablement/example-app"
     }
     ```
2. specify quota values
     ```terraform
     module "example" {
       source           = "../../modules/tls-app"
       consume_topics   = ["dev-enablement.example-topic1", "dev-enablement.example-topic2"]
       consume_groups   = ["dev-enablement.example-consumer-group1", "dev-enablement.example-consumer-group2"]
       produce_topics   = ["dev-enablement.example-produce-topic"]
       consumer_byte_rate = 3145728 #  limit consuming to 3 MB/s
       producer_byte_rate = 4194304 # Limit producing to 4 MB/s
       cert_common_name = "dev-enablement/example-app"
     }
     ```
