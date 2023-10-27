resource "kafka_topic" "dd_run_events" {
  name               = "dd-run.events"
  replication_factor = 3
  partitions         = 10
}
