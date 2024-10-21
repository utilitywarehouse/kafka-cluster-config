# Kafka config for the shared cluster

## Cluster access
The shared kafka cluster requires mTLS for authentication and authorization.

Use the [tls-app](../../modules/tls-app) module for granting access for the apps to the cluster.

## Contributing

We want `utilitywarehouse/pubsub` to own any changes to the MSK clusters so please don't make any CODEOWNERS changes as
part PRs adding resources to the clusters.

We have a custom `tflint` plugin that help enforce best practices and avoid some
common issues. This is run through `pre-commit`, see [the contributing
docs](../../CONTRIBUTING.md) for installation details. See [the plugin repo's
README for a list of the
rules](https://github.com/utilitywarehouse/tflint-ruleset-kafka-config/blob/main/README.md#rules).

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
- [dev](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/dev-aws/pubsub/msk)
- [prod](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/prod-aws/pubsub/msk)

### How to start a new team module

#### Set up the terraform team module
Create a folder with your team name under the current folder and copy everything, with keeping the symbolic links, from the folder `_template_team_x`. 
Then replace in every file `_template_team_x` with your team name
   
Example commands:
```bash
export TEAM=myteam
mkdir -p "${TEAM}"
cp -a  _template_team_x/* "${TEAM}"
for f in "${TEAM}"/*; do sed -i '' "s/_template_team_x/${TEAM}/g" $f; done
```

#### Set up the terraform applier for this terraform team module
In the kubernetes-manifests repository, under [dev](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/dev-aws/pubsub/msk) or [prod](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/prod-aws/pubsub/msk) 
copy the file `tf-module-_template_team_x.yaml` into one with your team name and then replace `team_x` with your team name in the file.
Example commands:
```bash
export TEAM=myteam
cat tf-module-_template_team_x.yaml| sed "s/team_x/${TEAM}/g" > tf-module-${TEAM}.yaml 
```

After the PR with the new file will be merged in the main branch, the terraform-applier will pick up this new CRD 
and an entry for your team will appear in the UI in [dev](https://terraform-applier-system.dev.aws.uw.systems/#pubsub) or [prod](https://terraform-applier-system.prod.aws.uw.systems/#pubsub).

Please note that this module is created in `plan-only` mode, meaning it will only issue the `terraform plan` command without applying. 
After you check that the configuration for the module is ok and the plan is as expected, you can enable the apply mode by setting in this file `planOnly: false`.

## pubsub admins: debugging terraform

See [instructions](TERRAFORM_DEBUG.md)
