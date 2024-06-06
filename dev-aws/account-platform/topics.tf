resource "kafka_topic" "account_events_v2" {
  config = {
    "compression.type" = "snappy"
  }
  name               = "account.events.v2"
  partitions         = 15
  replication_factor = 3
}


resource "kafka_topic" "legacy_account_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
    "segment.ms"     = "604800000"
  }
  name               = "legacy.account.events.compacted"
  partitions         = 50
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.changelog.events"
resource "kafka_topic" "legacy_account_changelog_events" {
  config = {
    "cleanup.policy"            = "compact"
    "delete.retention.ms"       = "100"
    "min.cleanable.dirty.ratio" = "0.01"
  }
  name               = "legacy.account.changelog.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "staff.okta.v6"
resource "kafka_topic" "staff_okta_v6" {
  config = {
    "cleanup.policy" = "delete"
  }
  name               = "staff.okta.v6"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "finance.events.compacted"
resource "kafka_topic" "finance_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
  }
  name               = "finance.events.compacted"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.events"
resource "kafka_topic" "legacy_account_events" {
  config = {
    "cleanup.policy" = "delete"
  }
  name               = "legacy.account.events"
  partitions         = 50
  replication_factor = 3
}

# __generated__ by Terraform from "account.exceptions.v1"
resource "kafka_topic" "account_exceptions_v1" {
  config = {
    "compression.type" = "snappy"
  }
  name               = "account.exceptions.v1"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.change.events.compacted"
resource "kafka_topic" "legacy_account_change_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
  }
  name               = "legacy.account.change.events.compacted"
  partitions         = 50
  replication_factor = 3
}

# __generated__ by Terraform from "account.events.v3"
resource "kafka_topic" "account_events_v3" {
  config = {
    "cleanup.policy" = "delete"
  }
  name               = "account.events.v3"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "account.exceptions.events"
resource "kafka_topic" "account_exceptions_events" {
  config = {
    "compression.type" = "snappy"
  }
  name               = "account.exceptions.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "supply.address.exception.check.events"
resource "kafka_topic" "supply_address_exception_check_events" {
  config = {
    "cleanup.policy"      = "delete"
    "delete.retention.ms" = "604800000"
    "retention.ms"        = "604800000"
  }
  name               = "supply.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "supply.address.debt.exception.check.events"
resource "kafka_topic" "supply_address_debt_exception_check_events" {
  config = {
    "cleanup.policy"      = "delete"
    "delete.retention.ms" = "604800000"
    "retention.ms"        = "604800000"
  }
  name               = "supply.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.braze.events.compacted"
resource "kafka_topic" "legacy_account_braze_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
  }
  name               = "legacy.account.braze.events.compacted"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "correspondence.address.exception.check.events"
resource "kafka_topic" "correspondence_address_exception_check_events" {
  config = {
    "cleanup.policy"      = "delete"
    "delete.retention.ms" = "604800000"
    "retention.ms"        = "604800000"
  }
  name               = "correspondence.address.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "address.lookup.analytics.v1"
resource "kafka_topic" "address_lookup_analytics_v1" {
  config             = {}
  name               = "address.lookup.analytics.v1"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "land-registry.check.events"
resource "kafka_topic" "land_registry_check_events" {
  config = {
    "compression.type" = "snappy"
  }
  name               = "land-registry.check.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "internal.legacy.account.events"
resource "kafka_topic" "internal_legacy_account_events" {
  config             = {}
  name               = "internal.legacy.account.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "account.atomic.v1"
resource "kafka_topic" "account_atomic_v1" {
  config = {
    "cleanup.policy" = "delete"
  }
  name               = "account.atomic.v1"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "account.unified.events"
resource "kafka_topic" "account_unified_events" {
  config = {
    "cleanup.policy" = "compact"
    "retention.ms"   = "100"
  }
  name               = "account.unified.events"
  partitions         = 50
  replication_factor = 3
}

# __generated__ by Terraform from "dev.account.events.anonymized.v0"
resource "kafka_topic" "dev_account_events_anonymized_v0" {
  config             = {}
  name               = "dev.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "correspondence.address.debt.exception.check.events"
resource "kafka_topic" "correspondence_address_debt_exception_check_events" {
  config = {
    "cleanup.policy"      = "delete"
    "delete.retention.ms" = "604800000"
    "retention.ms"        = "604800000"
  }
  name               = "correspondence.address.debt.exception.check.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.holder.events.compacted"
resource "kafka_topic" "legacy_account_holder_events_compacted" {
  config = {
    "cleanup.policy" = "compact"
  }
  name               = "legacy.account.holder.events.compacted"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.created.in.bill.events"
resource "kafka_topic" "legacy_account_created_in_bill_events" {
  config             = {}
  name               = "legacy.account.created.in.bill.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.events.private"
resource "kafka_topic" "legacy_account_events_private" {
  config             = {}
  name               = "legacy.account.events.private"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "legacy.account.eqdb.events"
resource "kafka_topic" "legacy_account_eqdb_events" {
  config             = {}
  name               = "legacy.account.eqdb.events"
  partitions         = 15
  replication_factor = 3
}

# __generated__ by Terraform from "from-prod.account.events.anonymized.v0"
resource "kafka_topic" "from_prod_account_events_anonymized_v0" {
  config             = {}
  name               = "from-prod.account.events.anonymized.v0"
  partitions         = 15
  replication_factor = 3
}


resource "kafka_topic" "public_account_events" {
  config             = {}
  name               = "public.account.events"
  partitions         = 15
  replication_factor = 3
}
