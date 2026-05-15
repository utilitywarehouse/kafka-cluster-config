# These are moved from dev-aws/kafka-shared-msk/pubsub/ so we don't need to recreate them. Just import them into the the state.
import {
  to = kafka_acl.brokers_group
  id = "User:CN=*.devenablementpubsubmsk.zfikfc.c4.kafka.eu-west-1.amazonaws.com|*|Describe|Allow|Group|*|Literal"
}
import {
  to = kafka_acl.brokers_topic
  id = "User:CN=*.devenablementpubsubmsk.zfikfc.c4.kafka.eu-west-1.amazonaws.com|*|Describe|Allow|Topic|*|Literal"
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
