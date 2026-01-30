resource "kafka_topic" "account_history_eqdb_notifications_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms"                        = "64800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.account_history_eqdb_notifications_v1"
  partitions         = 1
  replication_factor = 3
}
resource "kafka_topic" "coffee_account_history_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 month
    "retention.ms"                        = "2629800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.coffee_account_history_v1"
  partitions         = 1
  replication_factor = 3
}
resource "kafka_topic" "coffee_services" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 1 month
    "retention.ms"                        = "2629800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.coffee_services"
  partitions         = 1
  replication_factor = 3
}
resource "kafka_topic" "payments_audit_log_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 7 years
    "retention.ms"                        = "220898664000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.payments_audit_log_v1"
  partitions         = 10
  replication_factor = 3
}
resource "kafka_topic" "reminders_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms"                        = "126227808000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.reminders_v1"
  partitions         = 5
  replication_factor = 3
}
resource "kafka_topic" "reminders_notifications_v1" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # keep data for 18 hours
    "retention.ms"                        = "64800000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.reminders_notifications_v1"
  partitions         = 5
  replication_factor = 3
}
resource "kafka_topic" "vulnerability_v6" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms"                        = "126227808000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.vulnerability_v6"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "notes_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms"                        = "126227808000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.notes_v2"
  partitions         = 15
  replication_factor = 3
}
resource "kafka_topic" "ticketing_v2" {
  config = {
    "cleanup.policy" = "delete"
    # Recommended by dev-ena
    "compression.type" = "zstd"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 1 day
    "local.retention.ms" = "86400000"
    # keep data for 4 years
    "retention.ms"                        = "126227808000"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
  name               = "customer-support.ticketing_v2"
  partitions         = 5
  replication_factor = 3
}
