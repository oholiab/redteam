TOKEN_CMD?=pass show redteam_do_token
VARS=-var="do_token=$(shell $(TOKEN_CMD))"
VARS+=-var="key_location=$(HOME)/.ssh/id_ecdsa.pub"

.terraform:
	terraform init

plan apply destroy: .terraform
	terraform $@ $(VARS)

ip: terraform.tfstate
	@jq '.modules[].resources."digitalocean_droplet.red01".primary.attributes.ipv4_address' -r < terraform.tfstate
