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

  # Source consumer groups the checkpoint connector syncs offsets for, keyed by the mirrored
  # topic they consume. The ACL is on the group only, so the topic is just how this list is
  # organised: add a key per new mirrored topic. A group reading more than one topic may
  # appear under several keys - the ACLs are deduplicated below.
  #
  # See the mirror_maker_source_group_sync comment below for why these are unprefixed and why
  # Read is the operation granted.
  mirror_maker_source_groups = {
    order_events = [
      // consumer groups in energy-platform namespace:
      "order-indexer",
      "ordering-executor",
      "bill-gas-record-producer",
      "service-request-fixer",
      "comms-orchestrator",
      "unicom-adapter",
      "energy-bq-connector",
      "crm-graphql-projector",
      "ev-tariffs-projector",
      "ensek-connector-projecion",
      "bill-registration-updater",
      // consumer groups from other namespaces:
      "energy-billing.billing-projector",
    ]
    # new topics and their consumer groups go here, keyed by the topic name, to keep the list organised.
  }
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
# syncs offsets to groups named exactly as they are on the source: unprefixed. That is the UW
# pattern - kafka-consumer-group-mirror then copies each one into energy-platform.<group>,
# which is what the apps actually consume under. See
# kubernetes-manifests/dev-merit/pubsub/msk-team-migrations/README.md.
#
# Read, not Describe: syncGroupOffset calls alterConsumerGroupOffsets, which needs Read on the
# group. Read implies Describe, and Read on the mirrored topics comes from
# mirror_maker_mirrored_topics above. Mirror-maker only writes to a group that is EMPTY or DEAD
# here, never one with active members.
#
# energy-billing.billing-projector already carries its own team prefix, so its source and
# target names coincide - mirror-maker seeds it directly and kafka-consumer-group-mirror skips
# it.
#
# Keep local.mirror_maker_source_groups in sync with GROUPS in
# kubernetes-manifests/dev-merit/energy-platform/kafka/mirror-maker/deployment.yaml.
resource "kafka_acl" "mirror_maker_source_group_sync" {
  for_each                     = toset(flatten(values(local.mirror_maker_source_groups)))
  resource_name                = each.value
  resource_type                = "Group"
  acl_principal                = local.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = "Read"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}
