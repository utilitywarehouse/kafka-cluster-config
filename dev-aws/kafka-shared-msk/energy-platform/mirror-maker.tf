# Mirror maker 2 replicating the self hosted energy-platform cluster in dev-merit into this
# shared cluster. Deployed from
# kubernetes-manifests/dev-merit/energy-platform/kafka/mirror-maker, it authenticates with a
# cert whose common name is below.
#
# Note this is a team owned mirror-maker, separate from the pubsub one in
# ../pubsub/mirror-maker.tf, so it needs its own ACLs.
locals {
  mirror_maker_principal = "User:CN=energy-platform/mirror-maker"

  # The MM2 connect worker keeps its state in these topics on the target cluster. Their names
  # are derived from the source cluster alias (energy-platform), not from the team prefix, so
  # they cannot be declared as kafka_topic resources here and mirror-maker creates them itself
  # on first start.
  mirror_maker_worker_topics = [
    "mm2-configs.energy-platform.internal",
    "mm2-offsets.energy-platform.internal",
    "mm2-status.energy-platform.internal",
  ]
}

# The connect worker reads, writes and creates its own internal topics.
resource "kafka_acl" "mirror_maker_worker_topics" {
  for_each                     = toset(local.mirror_maker_worker_topics)
  resource_name                = each.value
  resource_type                = "Topic"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}

# The connect worker's consumer group, named <source alias>-mm2 by mirror-maker.
resource "kafka_acl" "mirror_maker_worker_group" {
  resource_name                = "energy-platform-mm2"
  resource_type                = "Group"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}

# Everything mirror-maker writes for this flow lands under the team prefix: the mirrored
# topics themselves plus energy-platform.checkpoints.internal and
# energy-platform.heartbeats. It also reads the mirrored topics back when syncing consumer
# group offsets, and creates the checkpoint and heartbeat topics itself.
resource "kafka_acl" "mirror_maker_mirrored_topics" {
  resource_name                = "energy-platform."
  resource_type                = "Topic"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = "All"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Prefixed"
}

# The heartbeat connector emits into an unprefixed, cluster wide `heartbeats` topic, shared
# with every other mirror-maker pointed at this cluster. Write only, so this flow cannot
# delete or reconfigure it.
resource "kafka_acl" "mirror_maker_heartbeats_topic" {
  for_each                     = toset(["Create", "Describe", "Write"])
  resource_name                = "heartbeats"
  resource_type                = "Topic"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = each.value
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}

# The connect worker calls DescribeCluster on startup to resolve the cluster id.
resource "kafka_acl" "mirror_maker_cluster_describe" {
  for_each                     = toset(["Describe", "DescribeConfigs"])
  resource_name                = "kafka-cluster"
  resource_type                = "Cluster"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = each.value
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}

# The checkpoint connector polls the target cluster for the state of every group in the
# mirror-maker GROUPS list, to work out which ones are idle and safe to rewind. It asks for
# them under their *source* names, unprefixed, because mirror-maker does not apply the
# replication policy to group ids - see the note in
# kubernetes-manifests/dev-merit/pubsub/msk-team-migrations/README.md.
#
# These groups do not exist on this cluster under these names, and we do not want them to:
# the energy-platform.* groups in orders.tf are the real ones. Describe is therefore all that
# is granted. With it the connector sees each group as DEAD, skips it, and stops logging
# GroupAuthorizationException; without Read it can never commit offsets to an unprefixed
# group here.
#
# One name below is not hypothetical: energy-billing.billing-projector is a real group on
# this cluster (see orders.tf), because it belongs to energy-billing and so is not under the
# energy-platform. prefix. For that one group the source and target names coincide, so if it
# is ever EMPTY the connector will try to rewind it and log a GroupAuthorizationException for
# the missing Read. Granting Read would let this mirror-maker rewrite another team's committed
# offsets on MSK, so it is deliberately withheld.
#
# Keep this list in sync with GROUPS in
# kubernetes-manifests/dev-merit/energy-platform/kafka/mirror-maker/deployment.yaml.
resource "kafka_acl" "mirror_maker_source_group_describe" {
  for_each = toset([
    "bill-gas-record-producer",
    "bill-proximo-provisioning-adapter",
    "comms-orchestrator",
    "crm-graphql-projector",
    "energy-billing.billing-projector",
    "energy-bq-connector",
    "ensek-connector-projection",
    "ev-tariffs-projector",
    "order-indexer",
    "ordering-executor",
    "service-requests-fixer",
    "unicom-adapter",
  ])
  resource_name                = each.value
  resource_type                = "Group"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = "Describe"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}
