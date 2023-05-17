resource "kafka_topic" "test_ff" {
  name               = "test_ff"
  replication_factor = 3
  partitions         = 15
}
