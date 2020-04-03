OPTS :=

enable-apis:
	@bash -eu scripts/enable-apis.bash

init: .terraform/terraform.tfstate

plan: init
	@terraform plan $(OPTS) deployments

apply: init
	@terraform apply $(OPTS) deployments

destroy: init
	@terraform destroy $(OPTS) deployments

.terraform/terraform.tfstate:
	@terraform init deployments

.PHONY: enable-api init plan deploy
