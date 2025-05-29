resource "kafka_topic" "unicom_bill_events" {
  name               = "unicom.bill-events"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_bill_failed" {
  name               = "unicom.bill-failed"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_bounce_2019_1" {
  name               = "unicom.bounce.2019.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_caps" {
  name               = "unicom.caps"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_caps_consent" {
  name               = "unicom.caps-consent"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_failed" {
  name               = "unicom.failed"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_cancel_status_1" {
  name               = "unicom.cancel-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_cancellation_1" {
  name               = "unicom.cancellation.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_clx_report" {
  name               = "unicom.clx-report"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_comms_fallback_1" {
  name               = "unicom.comms-fallback.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_cost_calculated_1" {
  name               = "unicom.cost-calculated.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_batch_1" {
  name               = "unicom.email-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_post_delivery_1" {
  name               = "unicom.email-post-delivery.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_critical_1" {
  name               = "unicom.email-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_important_1" {
  name               = "unicom.email-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_1" {
  name               = "unicom.email-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_mock_critical_1" {
  name               = "unicom.email-released-mock-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_mock_important_1" {
  name               = "unicom.email-released-mock-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_mock_1" {
  name               = "unicom.email-released-mock.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_ses_critical_1" {
  name               = "unicom.email-released-ses-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_ses_important_1" {
  name               = "unicom.email-released-ses-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_released_ses_1" {
  name               = "unicom.email-released-ses.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_email_status_1" {
  name               = "unicom.email-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_go_inspire_letter_status_1" {
  name               = "unicom.go-inspire-letter-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_letter_batch_critical_1" {
  name               = "unicom.letter-batch-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_letter_batch_important_1" {
  name               = "unicom.letter-batch-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_letter_batch_1" {
  name               = "unicom.letter-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_letter_released_critical_1" {
  name               = "unicom.letter-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_letter_released_important_1" {
  name               = "unicom.letter-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_letter_released_1" {
  name               = "unicom.letter-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_letter_status_1" {
  name               = "unicom.letter-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_mparticle_output_integration" {
  name               = "unicom.mparticle-output-integration"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_orchestration_entity_1" {
  name               = "unicom.orchestration-entity.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_orchestration_rule_execution_1" {
  name               = "unicom.orchestration-rule-execution.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_outbound_call_request" {
  name               = "unicom.outbound-call-request"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_rejected" {
  name               = "unicom.rejected"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_rendered_1" {
  name               = "unicom.rendered.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_requests" {
  name               = "unicom.requests"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_scheduled_1" {
  name               = "unicom.scheduled.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_send_notification_1" {
  name               = "unicom.send-notification.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_sms_batch_1" {
  name               = "unicom.sms-batch.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_sms_released_critical_1" {
  name               = "unicom.sms-released-critical.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_sms_released_important_1" {
  name               = "unicom.sms-released-important.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_sms_released_1" {
  name               = "unicom.sms-released.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_sms_status_1" {
  name               = "unicom.sms-status.1"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_status" {
  name               = "unicom.status"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_status_bill_email_connector" {
  name               = "unicom.status-bill-email-connector"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_status_energy_smets1_notifier" {
  name               = "unicom.status-energy-smets1-notifier"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_status_finance_email_delivery_engine" {
  name               = "unicom.status-finance-email-delivery-engine"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_status_v2" {
  name               = "unicom.status-v2"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

resource "kafka_topic" "unicom_tests" {
  name               = "unicom.tests"
  partitions         = 15
  replication_factor = 3

  config = {
    "cleanup.policy"   = "delete"
    "compression.type" = "zstd"
    # keep data for 3 months
    "retention.ms" = "7889400000"
    # enable remote storage
    "remote.storage.enable" = "true"
    # keep data in primary storage for 3 days
    "local.retention.ms" = "259200000"
    # allow for a batch of records maximum 512MiB
    "max.message.bytes" = "536870912"
  }
}

module "unit_sender_email" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.unicom_email_released_critical_1.name,
    kafka_topic.unicom_email_released_important_1.name,
    kafka_topic.unicom_email_released_1.name,
  ]
  produce_topics = [
    kafka_topic.unicom_cost_calculated_1.name,
    kafka_topic.unicom_tests.name,
    kafka_topic.unicom_email_status_1.name,
    kafka_topic.unicom_rendered_1.name,
    kafka_topic.unicom_failed.name,
    kafka_topic.unicom_comms_fallback_1.name,

  ]
  consume_groups   = ["unicom.unit-sender-email"]
  cert_common_name = "unicom/unit-sender-email"
}

module "unit_sender_letter" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.unicom_letter_released_critical_1.name,
    kafka_topic.unicom_letter_released_important_1.name,
    kafka_topic.unicom_letter_released_1.name,
  ]
  produce_topics = [
    kafka_topic.unicom_cost_calculated_1.name,
    kafka_topic.unicom_tests.name,
    kafka_topic.unicom_letter_status_1.name,
    kafka_topic.unicom_rendered_1.name,
    kafka_topic.unicom_failed.name,
    kafka_topic.unicom_comms_fallback_1.name,

  ]
  consume_groups   = ["unicom.unit-sender-letter"]
  cert_common_name = "unicom/unit-sender-letter"
}

module "batch_projector" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.unicom_letter_released_critical_1.name,
    kafka_topic.unicom_letter_released_important_1.name,
    kafka_topic.unicom_letter_released_1.name,
  ]

  produce_topics = [
    kafka_topic.unicom_letter_status_1.name,
    kafka_topic.unicom_tests.name,
    kafka_topic.unicom_cost_calculated_1.name,
    kafka_topic.unicom_rendered_1.name,
    kafka_topic.unicom_failed.name,
    kafka_topic.unicom_comms_fallback_1.name,
  ]
  consume_groups   = ["unicom.batch-projector"]
  cert_common_name = "unicom/batch-projector"
}

module "batch_releaser" {
  source = "../../../modules/tls-app"
  consume_topics = [
  ]

  produce_topics = [
    kafka_topic.unicom_email_batch_1.name,
    kafka_topic.unicom_sms_batch_1.name,
    kafka_topic.unicom_letter_batch_1.name,
  ]
  consume_groups   = ["unicom.batch-releaser"]
  cert_common_name = "unicom/batch-releaser"
}

module "batch_sender" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.unicom_letter_batch_critical_1.name,
    kafka_topic.unicom_letter_batch_important_1.name,
    kafka_topic.unicom_letter_batch_1.name,
  ]

  produce_topics = [
    kafka_topic.unicom_letter_status_1.name,
    kafka_topic.unicom_tests.name,
    kafka_topic.unicom_cost_calculated_1.name,
    kafka_topic.unicom_rendered_1.name,
    kafka_topic.unicom_failed.name,
    kafka_topic.unicom_comms_fallback_1.name,
  ]
  consume_groups   = ["unicom.batch-sender"]
  cert_common_name = "unicom/batch-sender"
}
