# --- Auth config for the backup of insurance kafka topics ---
module "insurance_event_relay_backup" {
  source = "../../../modules/tls-app"
  produce_topics = [
    kafka_topic.private_accounts_v1.name,
    kafka_topic.private_claims_v1.name,
    kafka_topic.private_comms_v1.name,
    kafka_topic.private_coverage_v1.name,
    kafka_topic.private_documents_v1.name,
    kafka_topic.private_durell_edi_v1.name,
    kafka_topic.private_eligibility_v1.name,
    kafka_topic.private_renewal_dates_v1.name,
    kafka_topic.private_policies_v1.name,
    kafka_topic.private_policy_prices_v1.name,
    kafka_topic.private_quotes_v1.name,
  ]
  cert_common_name = "insurance/event-relay-backup"
}


# --- List of kafka insurance topics to be backed up ---
resource "kafka_topic" "private_accounts_v1" {
  name = "insurance.private.accounts.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_claims_v1" {
  name = "insurance.private.claims.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_comms_v1" {
  name = "insurance.private.comms.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_coverage_v1" {
  name = "insurance.private.coverage.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_documents_v1" {
  name = "insurance.private.documents.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_durell_edi_v1" {
  name = "insurance.private.durell.edi.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_eligibility_v1" {
  name = "insurance.private.eligibility.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_renewal_dates_v1" {
  name = "insurance.private.renewal_dates.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_policies_v1" {
  name = "insurance.private.policies.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_policy_prices_v1" {
  name = "insurance.private.policy_prices.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}

resource "kafka_topic" "private_quotes_v1" {
  name = "insurance.private.quotes.v1"

  replication_factor = 3
  partitions         = 15

  config = {
    "remote.storage.enable" = "true"
    "retention.bytes"       = "-1"      # keep on each partition unlimited data
    "retention.ms"          = "-1"      # keep data forever
    "local.retention.ms"    = "3600000" # keep data in primary storage for 1 hour
    "max.message.bytes"     = "1048576" # allow for a batch of records maximum 1MiB
    "compression.type"      = "zstd"
    "cleanup.policy"        = "delete"
  }
}
