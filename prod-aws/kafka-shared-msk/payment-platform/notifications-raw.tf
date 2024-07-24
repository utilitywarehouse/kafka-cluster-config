resource "kafka_topic" "notifications_worldpay_raw" {
  name               = "payment-platform.notifications.worldpay.raw"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

module "payment_worldpay_notification_listener" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.notifications_worldpay_raw.name,
  ]
  produce_topics = [
    kafka_topic.notifications_worldpay_raw.name,
  ]
  consume_groups   = ["payment-platform.payment-worldpay-notification-listener"]
  cert_common_name = "payment-platform/payment-worldpay-notification-listener"
}

resource "kafka_topic" "notifications_stripe_raw" {
  name               = "payment-platform.notifications.stripe.raw"
  replication_factor = 3
  partitions         = 15
  config = {
    "compression.type" = "zstd"
    "retention.bytes"  = "3758096384"
    # Use tiered storage
    "remote.storage.enable" = "true"
    # keep data in hot storage for 2 days
    "local.retention.ms" = "172800000"
    # keep data for 1 year
    "retention.ms"   = "31557600000"
    "cleanup.policy" = "delete"
  }
}

module "payment_stripe_notification_listener" {
  source = "../../../modules/tls-app"
  consume_topics = [
    kafka_topic.notifications_stripe_raw.name,
  ]
  produce_topics = [
    kafka_topic.notifications_stripe_raw.name,
  ]
  consume_groups   = ["payment-platform.payment-stripe-notification-listener"]
  cert_common_name = "payment-platform/payment-stripe-notification-listener"
}

