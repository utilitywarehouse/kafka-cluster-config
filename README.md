# Terraform configuration for kafka clusters

Uses [this terraform kafka provider](https://registry.terraform.io/providers/Mongey/kafka/latest/docs) for defining the resources.

Aggregates resources for different teams willing to migrate from the [kafka topic applier](https://github.com/utilitywarehouse/kafka-topic-applier) or other styles of configuring topics.

## Contributing

Linting & generation files is handled via `pre-commit`.

### Initial setup
Follow the [install instructions](https://pre-commit.com/#install), and additionally [install Terraform](https://developer.hashicorp.com/terraform/install) and [tflint](https://github.com/terraform-linters/tflint?tab=readme-ov-file#installation). 
Then install and run the hooks to test:

``` console
$ pre-commit install
# do a test run on all the files in the repo
$ pre-commit run --all-files
```
The validations will run automatically, from now on, **before each git commit**.

## MSK backup bucket retention synchronisation
This section describes the automated process for aligning the S3 backup lifecycle with our MSK topic retention policies. For more background, see the [MSK Backup Strategy documentation](https://github.com/utilitywarehouse/documentation/blob/master/infra/operational/msk-ops.md#msk-data-backup).

### Automation Workflow

We use a Git pre-commit hook to ensure that the S3 lifecycle policies for our backup bucket never diverge from the Kafka topic configurations stored in this repository.

When you run `git commit`, the `generate_backup_bucket_retention.sh` script is triggered automatically. This script parses the `retention.ms` setting for every topic and generates a Terraform configuration (`generated-retention.tf`). This file defines the S3 `Expiration` action for each topic's backup prefix, ensuring that backup data is deleted after the specified retention period.

### Your Responsibility

**Important:** For this automation to function, you must first perform the one-time configuration detailed in the [Initial setup](#initial-setup) chapter of this file. This step installs the pre-commit hook required for the script to run.

Once the setup is complete, your only ongoing responsibility is to manage the retention settings in the Kafka topic configuration files. The pre-commit hook handles the task of translating that setting into the required S3 lifecycle policy, which prevents configuration drift and simplifies storage management.

As an alternative, you can also manually run `make generate` before committing, so that your commit succeeds from the start.

## Why is this repository public?
It contains standard kafka configuration and does not include confidential information

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
