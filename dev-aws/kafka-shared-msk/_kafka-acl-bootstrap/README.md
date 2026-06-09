# Kafka ACL Bootstrap module
This module should be applied FIRST on an MSK cluster.

It gives terraform-applier the permissions needed to apply further other modules.

## Why do we need this?
MSK is configured to use mutual TLS for authentication. In this case Kafka ACLs are required and enforced when accessing resources.

The only time they are not enforced is on the **FIRST** session after the cluster is provision. Once an ACL is created on the cluster, the check is enforced.
This why the first ACL that we create should be for an admin user that allows us to interact with the cluster further.
