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

# Mirror-maker does not apply the replication policy to group ids, so the checkpoint connector
# syncs offsets to groups on this cluster named exactly as they are on the source: unprefixed.
# That is intentional in the UW pattern rather than a quirk to work around -
# kafka-consumer-group-mirror reads these source-named groups here and copies each one into
# energy-platform.<group>, which is what the apps in orders.tf actually consume under. See
# kubernetes-manifests/dev-merit/pubsub/msk-team-migrations/README.md.
#
# Read, not Describe. refreshIdleConsumerGroupOffset treats a group that is DEAD here - which is
# every one of these on first run - as a new consumer group to seed, and syncGroupOffset then
# calls alterConsumerGroupOffsets for it, which requires Read on the group. Describe alone gets
# as far as the lookup and then fails the write. Read implies Describe, so it is not granted
# separately, and Read on energy-platform.order.events comes from mirror_maker_mirrored_topics
# above.
#
# The blast radius is bounded by mirror-maker itself: it only writes to a group that is EMPTY or
# DEAD here, never one with active members, and for EMPTY it skips any partition where this
# cluster is already ahead.
#
# energy-billing.billing-projector is the one entry that is already a live group here (see
# orders.tf) rather than a name mirror-maker creates, because it belongs to energy-billing and so
# keeps its own prefix. Source and target names coincide for it, so mirror-maker seeds it
# directly and kafka-consumer-group-mirror must leave it out - prefixing it would produce
# energy-platform.energy-billing.billing-projector, which nothing consumes.
#
# Keep this list in sync with GROUPS in
# kubernetes-manifests/dev-merit/energy-platform/kafka/mirror-maker/deployment.yaml.
resource "kafka_acl" "mirror_maker_source_group_sync" {
  for_each = toset([
    "bill-gas-record-producer",
    "bill-proximo-provisioning-adapter",
    "comms-orchestrator",
    "crm-graphql-projector",
    "energy-billing.billing-projector",
    "energy-bq-connector",
    "ensek-connector-projecion",
    "ev-tariffs-projector",
    "order-indexer",
    "ordering-executor",
    "service-request-fixer",
    "unicom-adapter",
  ])
  resource_name                = each.value
  resource_type                = "Group"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = "Read"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}
