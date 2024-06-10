# consumes Cerbos audit records & forwards into Audit Ingest API
module "iam_audit_ingest_input_cerbos" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_cerbos_audit_v1.name)]
  consume_groups   = ["iam.audit-ingest-input-cerbos-v1"]
  cert_common_name = "iam-audit/ingest-input-cerbos"
}

module "iam_audit_ingest_connect_cerbos" {
  source           = "../../../modules/tls-app"
  consume_topics   = [(kafka_topic.iam_cerbos_audit_v1.name)]
  consume_groups   = ["iam.audit-ingest-connect-cerbos-v1"]
  cert_common_name = "iam-audit/ingest-connect-cerbos"
}
