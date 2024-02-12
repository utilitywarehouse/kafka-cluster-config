## How to work with Terraform locally
This is meant to be used only in **unexpected** situations like fixing the state or debugging the kafka provider.

In normal situations we rely on the [terraform applier](https://github.com/utilitywarehouse/terraform-applier) to apply on merge.

#### Prerequisities
- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- [kubefwd](https://github.com/txn2/kubefwd/releases) installed
- Following roles should exists in the .aws/credentials file:
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


#### Run the following commands to plan the changes

1. Reference AWS profile necessary to perform next actions- <br> `export AWS_PROFILE=pubsub-dev` <br> or <br> `export AWS_PROFILE=pubsub-prod` <br> in each terminal window.
2. Login to AWS- run from the `terraform` repo dir <br> `make okta-aws-cli-login` <br> More
   info [here](https://github.com/utilitywarehouse/terraform/tree/master/aws#okta-login)
3. Go to directory with the terraform state- e.g. <br> `cd dev-aws/kafka-shared`
4. Run <br> `make init` <br> to initialize terraform state. This needs to happen only once per directory.
5. In a separate window but in the same directory run <br> `make connect` <br> in order to connect to the Kafka cluster. <br>
6. Run <br> `make plan` <br> to see which changes will be applied.

After merging the changes to main, the changes will be applied automatically
with [Terraform applier](https://terraform-applier-system.dev.merit.uw.systems/#pubsub-kafka-shared)
