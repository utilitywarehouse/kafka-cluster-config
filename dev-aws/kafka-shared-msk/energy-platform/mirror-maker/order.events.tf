# Consumer groups whose offsets mirror-maker syncs for energy-platform.order.events. The topic
# itself is declared in ../orders.tf and these are its consumers, named as they are on the
# source cluster. See "Per-topic consumer group ACLs" in ../mirror-maker.tf for why these are
# unprefixed and why the operation is Read.
#
# energy-billing.billing-projector is the one entry that is already a live group here (see
# ../orders.tf) rather than a name mirror-maker creates, because it belongs to energy-billing and
# so keeps its own prefix. Source and target names coincide for it, so mirror-maker seeds it
# directly and kafka-consumer-group-mirror must leave it out - prefixing it would produce
# energy-platform.energy-billing.billing-projector, which nothing consumes.
resource "kafka_acl" "order_events_group_sync" {
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
  acl_principal                = var.mirror_maker_principal
  acl_host                     = "*"
  acl_operation                = "Read"
  acl_permission_type          = "Allow"
  resource_pattern_type_filter = "Literal"
}
