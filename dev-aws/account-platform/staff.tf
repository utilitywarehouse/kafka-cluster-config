resource "kafka_topic" "staff_okta_v6" {
  name               = "staff.okta.v6"
  replication_factor = 3
  partitions         = 15
}
