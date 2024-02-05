# Terraform configuration for kafka clusters to create topis and ACLs

## how to plan/ apply shared Kafka Terraform resources?

1. Login to AWS- run `make okta-aws-cli-login` for profile `pubsub-admin` from the `terraform` repo dir. More
   info [here](https://github.com/utilitywarehouse/terraform/tree/master/aws#okta-login)

```
[pubsub-dev]
region         = eu-west-1
role_arn       = arn:aws:iam::950135041896:role/pubsub-admin
source_profile = uw-prod-jump-role

[pubsub-prod]
region         = eu-west-1
role_arn       = arn:aws:iam::703452047160:role/pubsub-admin
source_profile = uw-prod-jump-role
```

Profile must be referenced while performing next actions, for example by running `export AWS_PROFILE=pubsub-dev` in each
terminal window.

2. Go to directory with the terraform state- e.g. `cd dev-aws/kafka-shared`
3. Run `make init` to initialize terraform state. This needs to happen only once per directory.
4. In a separate window but in the same directory run `make connect` in order to connect to the Kafka cluster. <br>
   This target requires [kubefwd](https://github.com/txn2/kubefwd/releases) installed. <br>
   This will open connections to Kafka cluster.
5. Run `make plan` to see what changes will be applied.

After merging the changes to main, the changes will be applied automatically
with [Terraform applier](https://terraform-applier-system.dev.merit.uw.systems/#pubsub-kafka-shared)
