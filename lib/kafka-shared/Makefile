CURRENT_CONTEXT := $(shell kubectl config current-context)

# cert files (in directory created by `certs` target)
KAFKA_CA_CERT := $(shell pwd)/certs-0/ca.crt
KAFKA_CLIENT_KEY := $(shell pwd)/certs-0/tls.key
KAFKA_CLIENT_CERT := $(shell pwd)/certs-0/tls.crt

certs:
	# obtain the certificates from the kafka pod
	kubectl exec --context "${CONTEXT}" -n "pubsub" "kafka-shared-0" -- tar cfh - "certs-0/ca.crt" "certs-0/tls.key" "certs-0/tls.crt" | tar xf -
	echo ${KAFKA_CA_CERT}

init: certs
	# terraform init
	terraform init \
  -backend-config region=eu-west-1 \
  -backend-config bucket=uw-dev-pubsub-tf-applier-state \
  -backend-config key="${CONTEXT}"/kafka-shared \
  -backend-config encrypt=true \
  -reconfigure \
  -upgrade


connect:
	# use given kubernetes context
	@if [ "${CONTEXT}" != "${CURRENT_CONTEXT}" ]; then\
		echo "Current kubectl context is: " ${CURRENT_CONTEXT};\
		echo "Can't connect to kafka from context: ${CONTEXT}";\
		echo "Please, first run command: ";\
		echo "\n\n kubectl config use-context " "${CONTEXT}" "\n\n";\
		return 1;\
	fi
	# forward traffic from local env to shared Kafka cluster
	sudo -E kubefwd services -n "pubsub" -l "app.kubernetes.io/name=kafka-shared" -d "pubsub.svc.cluster.${CLUSTER}"


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
