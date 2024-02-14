# TLS app Terraform module

This module defines the ACLs and quota needed by an app to communicate with an mTLS enabled kafka cluster.

See [main.tf](main.tf) for what resources it defines and [variables.tf](variables.tf) for available input variables.

## Usage example:
1. For the shared kafka cluster, following the [name prefix guidelines](../../prod-aws/kafka-shared/README.md#contributing)
    ```terraform
    module "example" {
      source           = "../../modules/tls-app"
      consume_topics   = { "dev-enablement.example-topic1" : "dev-enablement.example-consumer-group1", "dev-enablement.example-topic2": "dev-enablement.example-consumer-group2" }
      produce_topics   = ["dev-enablement.example-produce-topic"]
      cert_common_name = "dev-enablement/example-app"
    }
    ```
2. For a local team cluster 
    ```terraform
    module "example" {
      source           = "../../modules/tls-app"
      consume_topics   = { "example-topic1" : "example-consumer-group1", "example-topic2": "example-consumer-group2" }
      produce_topics   = ["example-produce-topic"]
      cert_common_name = "dev-enablement/example-app"
    }    
    ```

