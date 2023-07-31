SHELL := /bin/bash

.PHONY: okta-aws-cli-login
okta-aws-cli-login:
	@$(shell git rev-parse --show-toplevel)/exp-1-merit/lib/okta/okta-aws-cli
