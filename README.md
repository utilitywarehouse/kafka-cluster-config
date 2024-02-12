# Terraform configuration for kafka clusters

Uses [this terraform kafka provider](https://registry.terraform.io/providers/Mongey/kafka/latest/docs) for defining the resources.

Aggregates resources for different teams willing to migrate from the [kafka topic applier](https://github.com/utilitywarehouse/kafka-topic-applier) or other styles of configuring topics.

# Automatic apply
This repo is meant as a source repository for the [terraform applier](https://github.com/utilitywarehouse/terraform-applier).
After setting up the TF module, each merge in the main branch will be applied by the terraform applier.

To learn more and the steps needed for setting a new module, check the docs [here](https://github.com/utilitywarehouse/documentation/blob/master/infra/using-terraform-applier.md).
