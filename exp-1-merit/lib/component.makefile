SHELL := /bin/bash

# terraform wrapper
TF := $(shell git rev-parse --show-toplevel)/exp-1-merit/lib/tf

.PHONY: $(CMDS)
$(CMDS):
	@$(TF) $@ $(ARGS)

# # > download and update modules mentioned in the root module
# #
# # https://www.terraform.io/docs/cli/commands/get.html
.PHONY: update
update:
	@$(TF) get -update

.PHONY: init
init: update
	$(TF) init \
		-backend-config profile=${AWS_PROFILE} \
		-backend-config encrypt=true \
		-reconfigure \
		-upgrade

.PHONY: plan
plan:
	$(TF) plan $(ARGS)

.PHONY: certs
certs:
	mkdir ../certs;
	kubectl --context exp-1-merit -n pubsub get secrets kafka-shared-0-tls -o jsonpath='{.data.ca\.crt}' | base64 --decode > ../certs/ca.crt;
	kubectl --context exp-1-merit -n pubsub get secrets kafka-shared-0-tls -o jsonpath='{.data.tls\.crt}' | base64 --decode > ../certs/tls.crt;
	kubectl --context exp-1-merit -n pubsub get secrets kafka-shared-0-tls -o jsonpath='{.data.tls\.key}' | base64 --decode > ../certs/tls.key;
	chmod 600 ../certs/*;
