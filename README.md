# Terraform configuration for kafka clusters

Uses [this terraform kafka provider](https://registry.terraform.io/providers/Mongey/kafka/latest/docs) for defining the resources.

Aggregates resources for different teams willing to migrate from the [kafka topic applier](https://github.com/utilitywarehouse/kafka-topic-applier) or other styles of configuring topics.

## Contributing

### Linting
Linting is handled via the [pre-commit framework](https://pre-commit.com/). 

The configuration is in [.pre-commit-config.yaml](.pre-commit-config.yaml).

#### Gihub Actions
Linting runs in Github Actions based on the same configuration, so you can rely on it for validating the code.

You can shorten the feedback loop by installing it locally through the steps below.

#### Local setup
Follow the [install instructions](https://pre-commit.com/#install), and additionally [install Terraform](https://developer.hashicorp.com/terraform/install) and [tflint](https://github.com/terraform-linters/tflint?tab=readme-ov-file#installation). 
Then install and run the hooks to test:

``` console
$ pre-commit run --all-files
```
#### Run as pre-commit git hook
To run linting automatically, **before each git commit** you must install it as a hook:
``` console
$ pre-commit install
```

### Synchronizing S3 Backup Retention with MSK Topics

#### Overview

We back up MSK topic data to an S3 bucket. To align the S3 data lifecycle with the source topic's retention policy, we automatically generate Terraform configuration that sets the expiration for backed-up data.

The `make generate` command executes the [scripts/generate_backup_bucket_retention.sh](scripts/generate_backup_bucket_retention.sh) script. This script:
1.  Parses the `retention.ms` value for every topic.
2.  Generates the `generated-retention.tf` file.
3.  This file defines an S3 Lifecycle expiration rule for each topic's backup prefix, ensuring S3 objects are automatically deleted after the topic's retention period expires.

For more context, see the full [MSK Backup Strategy documentation](https://github.com/utilitywarehouse/documentation/blob/master/infra/operational/msk-ops.md#msk-data-backup).

#### CI automation
CI updates the generated files when they drift through automated commits on feature branches.

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
