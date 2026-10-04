# Gate resource: everything else in this module should be applied only after
# the bootstrap ACLs (tf-applier and brokers) exist. Depend on this instead of
# repeating the full list of bootstrap ACLs on each resource.
resource "terraform_data" "acl_bootstrap" {
  depends_on = [
    kafka_acl.tf_applier_topic,
    kafka_acl.tf_applier_group,
    kafka_acl.tf_applier_cluster,
    kafka_acl.brokers_topic,
    kafka_acl.brokers_group,
  ]
}
