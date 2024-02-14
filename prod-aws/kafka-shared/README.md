# Kafka config for the shared cluster

## Cluster access
The shared kafka cluster requires mTLS for authentication and authorization.

Use the [tls-app](../../modules/tls-app) module for granting access for the apps to the cluster.

## Contributing

Please follow these guidelines for the resources:
1. topic and consumer groups naming: prefix the names with the name of your team. Examples: **bex.internal.bill_fulfilled**, **bex.bills-total-api-reader** where **bex** is the name of the team.
   This will make it easier to define access in the kafka-ui ([dev](https://kafka-ui.dev.merit.uw.systems/) and [prod](https://kafka-ui.prod.merit.uw.systems/) )
2. consider the number of partitions for a topic. In Amazon MSK the total number of partitions influences the cost. See [RFC](https://wiki.uw.systems/posts/amazon-msk-managed-kafka-9kjst9t5#h97za-msk)

## pubsub admins: debugging terraform locally

See [instructions](TERRAFORM_LOCALLY.md)
