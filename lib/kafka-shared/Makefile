# cert files (in directory created by `certs` target)
KAFKA_CA_CERT := $(shell pwd)/certs-0/ca.crt
KAFKA_CLIENT_KEY := $(shell pwd)/certs-0/tls.key
KAFKA_CLIENT_CERT := $(shell pwd)/certs-0/tls.crt

CONTEXT := $(shell basename $(shell dirname ${PWD}))
ENV := $(shell echo ${CONTEXT} | cut -d"-" -f1)
PROVIDER := $(shell echo ${CONTEXT} | rev | cut -d"-" -f1 | rev)

certs:
	# obtain the certificates from the kafka pod
	kubectl exec --context "${CONTEXT}" -n "pubsub" "kafka-shared-0" -- tar cfh - "certs-0/ca.crt" "certs-0/tls.key" "certs-0/tls.crt" | tar xf -

init: certs
	# terraform init
	terraform init \
  -backend-config region=eu-west-1 \
  -backend-config bucket=uw-${ENV}-pubsub-tf-applier-state \
  -backend-config key="${CONTEXT}"/kafka-shared \
  -backend-config encrypt=true \
  -reconfigure \
  -upgrade


connect:
	# forward traffic from local env to shared Kafka cluster
	sudo -E kubefwd -x "${CONTEXT}" services -n "pubsub" -l "app.kubernetes.io/name=kafka-shared" -d "pubsub.svc.cluster.${PROVIDER}"


plan: certs
	KAFKA_CA_CERT=${KAFKA_CA_CERT} \
	KAFKA_CLIENT_KEY=${KAFKA_CLIENT_KEY} \
	KAFKA_CLIENT_CERT=${KAFKA_CLIENT_CERT} \
	terraform plan

apply: certs
	KAFKA_CA_CERT=${KAFKA_CA_CERT} \
	KAFKA_CLIENT_KEY=${KAFKA_CLIENT_KEY} \
	KAFKA_CLIENT_CERT=${KAFKA_CLIENT_CERT} \
	terraform apply
