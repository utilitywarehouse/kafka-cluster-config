# Kafka config for the shared cluster

## Cluster access
The shared kafka cluster requires mTLS for authentication and authorization.

Use the [tls-app](../../modules/tls-app) module for granting access for the apps to the cluster.

## Contributing

We want utilitywarehouse/pubsub to own any chages to the msk clusters so please don't make any CODEOWNERS changes as
part PRs adding resouces to the clusters.

Please follow these guidelines for the resources:
1. topic and consumer groups naming: prefix the names with the name of your team and use `-` for names separation in the prefix. Examples: **data-infra.internal.bill_fulfilled**, **data-infra.bills-total-api-reader** where **data-infra** is the name of the team.
   This will make it easier to define access in the kafka-ui ([dev](https://kafka-ui.dev.uw.systems/) and [prod](https://kafka-ui.prod.uw.systems/) )
2. consider the number of partitions for a topic. In Amazon MSK the total number of partitions influences the cost. See [RFC](https://wiki.uw.systems/posts/amazon-msk-managed-kafka-9kjst9t5#h97za-msk)
3. use the zstd compression for topics
4. in MSK topics should have the replication factor set to 3
5. if you need to keep the data longer than 3 days, consider using [tiered storage](https://docs.aws.amazon.com/msk/latest/developerguide/msk-tiered-storage.html), and you need to decide how much of your data needs to be on the local hot storage. [Here](https://github.com/utilitywarehouse/kafka-cluster-config/blob/07f9b2be2c02aef072fe3900c3d4ee86fb0e282c/dev-aws/kafka-shared-msk/data-infra/data-infra.tf#L1-L16) is an example
6. Amazon MSK doesn't support tiered storage for compacted topics. Check the [limitations](https://docs.aws.amazon.com/msk/latest/developerguide/msk-tiered-storage.html#msk-tiered-storage-constraints) for more details 

When migrating to the MSK cluster, please consider also the following:
1. the number of partitions in MSK needs to be the same as in the source cluster.
2. the retention period in MSK needs to be the same as in the source cluster when migrating (we've experienced some issues when those did not match upon migration). If this needs chnaging please do it before the migration on your local kafka cluster.

## Structure
Each child folder contains a Terraform module for a team with the shared kafka resources for that team.

For each of these modules there is a [terraform applier](https://github.com/utilitywarehouse/terraform-applier) entry under:
- [dev](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/dev-aws/pubsub/kafka)
- [prod](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/prod-aws/pubsub/kafka)

## pubsub admins: debugging terraform

See [instructions](TERRAFORM_DEBUG.md)
