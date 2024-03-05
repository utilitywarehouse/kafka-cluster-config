# Kafka config for the shared cluster

## Cluster access
The shared kafka cluster requires mTLS for authentication and authorization.

Use the [tls-app](../../modules/tls-app) module for granting access for the apps to the cluster.

## Contributing

Please follow these guidelines for the resources:
1. topic and consumer groups naming: prefix the names with the name of your team. Examples: **bex.internal.bill_fulfilled**, **bex.bills-total-api-reader** where **bex** is the name of the team.
   This will make it easier to define access in the kafka-ui ([dev](https://kafka-ui.aws.merit.uw.systems/) and [prod](https://kafka-ui.prod.merit.uw.systems/) )
2. consider the number of partitions for a topic. In Amazon MSK the total number of partitions influences the cost. See [RFC](https://wiki.uw.systems/posts/amazon-msk-managed-kafka-9kjst9t5#h97za-msk)

## Structure
Each child folder contains a Terraform module for a team with the shared kafka resources for that team.

For each of these modules there is a [terraform applier](https://github.com/utilitywarehouse/terraform-applier) entry under:
- [dev](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/dev-aws/pubsub/kafka)
- [prod](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/prod-aws/pubsub/kafka)

## pubsub admins: debugging terraform locally

See [instructions](TERRAFORM_LOCALLY.md)
