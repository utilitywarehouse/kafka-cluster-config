resource "kafka_topic" "fraud_events" {
  name = "cbc.FraudEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "data_product_events_v1" {
  name = "cbc.DataProductEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable"               = "true"
    "retention.bytes"                     = "-1"         # keep on each partition unlimited data
    "retention.ms"                        = "2629746000" # keep data for 1 month
    "local.retention.ms"                  = "18000000"   # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"    # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "rating_events_v3" {
  name = "cbc.RatingEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "challenge_events_v1" {
  name = "cbc.ChallengeEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "charges_events_v1" {
  name = "cbc.ChargesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "lifecycle_events_v2" {
  name = "cbc.LifecycleEvents_v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "topup_events_v1" {
  name = "cbc.TopUpEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "transaction_events_v3" {
  name = "cbc.TransactionEvents_v3"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "openbanking_events_v1" {
  name = "cbc.OpenBankingEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "order_events_v1" {
  name = "cbc.OrderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "paymentology_events_v1" {
  name = "cbc.PaymentologyNotificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "sodexo_events_v1" {
  name = "cbc.SodexoEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "verification_events_v1" {
  name = "cbc.VerificationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "customer_events_v1" {
  name = "cbc.CustomerEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "migration_events_v1" {
  name = "cbc.MigrationEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "network_events_v1" {
  name = "cbc.NetworkEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "mdes_events_v1" {
  name = "cbc.MdesEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "service_events_v1" {
  name = "cbc.ServiceEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "crm_events_v1" {
  name = "cbc.CrmEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "legacy_account_events_v2" {
  name = "cbc.legacy.account.events.v2"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
resource "kafka_topic" "eqdb_loader_events_v1" {
  name = "cbc.EqdbLoaderEvents"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1" # keep on each partition unlimited data
    # tflint-ignore: msk_topic_no_infinite_retention, # infinite retention because ...
    "retention.ms"                        = "-1"       # keep data forever
    "local.retention.ms"                  = "18000000" # keep data in primary storage for 5 hours
    "max.message.bytes"                   = "2097152"  # allow for a batch of records maximum 2MiB
    "compression.type"                    = "zstd"
    "cleanup.policy"                      = "delete"
    "message.timestamp.difference.max.ms" = "9223372036854775807"
  }
}
