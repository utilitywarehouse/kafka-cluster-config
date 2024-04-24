# tflint-ignore: terraform_naming_convention
resource "kafka_topic" "staff-okta-v6" {
  name               = "staff.okta.v6"
  replication_factor = 3
  partitions         = 15
}
