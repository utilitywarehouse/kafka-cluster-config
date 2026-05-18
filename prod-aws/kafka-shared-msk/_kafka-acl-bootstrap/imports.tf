import {
  to = kafka_acl.brokers_group
  id = "User:CN=*.devenablementpubsubmsk.mw71ue.c2.kafka.eu-west-1.amazonaws.com|*|Describe|Allow|Group|*|Literal"
}
import {
  to = kafka_acl.brokers_topic
  id = "User:CN=*.devenablementpubsubmsk.mw71ue.c2.kafka.eu-west-1.amazonaws.com|*|Describe|Allow|Topic|*|Literal"
}
import {
  to = kafka_acl.tf_applier_cluster
  id = "User:CN=pubsub/tf-applier|*|All|Allow|Cluster|kafka-cluster|Literal"
}
import {
  to = kafka_acl.tf_applier_group
  id = "User:CN=pubsub/tf-applier|*|All|Allow|Group|*|Literal"
}
import {
  to = kafka_acl.tf_applier_topic
  id = "User:CN=pubsub/tf-applier|*|All|Allow|Topic|*|Literal"
}
import {
  to = kafka_acl.tf_applier_topic_deny_delete
  id = "User:CN=pubsub/tf-applier|*|Delete|Deny|Topic|*|Literal"
}
