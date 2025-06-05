# Terraform configuration for kafka clusters

Uses [this terraform kafka provider](https://registry.terraform.io/providers/Mongey/kafka/latest/docs) for defining the resources.

Aggregates resources for different teams willing to migrate from the [kafka topic applier](https://github.com/utilitywarehouse/kafka-topic-applier) or other styles of configuring topics.

## Contributing
See [Contributing doc](./CONTRIBUTING.md)

## Public?
Yes, it's intentional

## Structure
At the root of the repo there are folders for each cluster and environment the config applies to, like dev-aws, dev-merit, prod-aws, etc.

Under each such folder there are the TF modules for specific team kafka clusters. 
Examples: 
- [dev-aws/finance](dev-aws/finance) 
- [prod-aws/customer-billing](prod-aws/customer-billing)

## Shared kafka [AWS MSK](https://aws.amazon.com/msk/) cluster config

This repo includes the configuration for the active shared kafka cluster in:
- [dev-aws/kafka-shared-msk](dev-aws/kafka-shared-msk)
- [prod-aws/kafka-shared-msk](prod-aws/kafka-shared-msk)


## Automatic apply
This repo is meant as a source repository for the [terraform applier](https://github.com/utilitywarehouse/terraform-applier).
After setting up the TF module, each merge in the main branch will be applied by the terraform applier.

To learn more and the steps needed for setting a new module, check the docs [here](https://github.com/utilitywarehouse/documentation/blob/master/infra/using-terraform-applier.md).

Note that there is an expected deprecation warning:

    Warning: Argument is deprecated
    
      with provider["registry.terraform.io/mongey/kafka"],
      on __env.tf line 11, in provider "kafka":
      11: provider "kafka" {
    
    This parameter is now deprecated and will be removed in a later release,
    please use `client_key` instead.
    
    (and one more similar warning elsewhere)

See [the upstream
issue](https://github.com/Mongey/terraform-provider-kafka/issues/108)
