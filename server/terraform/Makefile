TOKEN_CMD?=pass show redteam_do_token
VARS=-var="do_token=$(shell $(TOKEN_CMD))"
VARS+=-var="key_location=$(HOME)/.ssh/id_ecdsa.pub"

.terraform:
	terraform init

plan apply: .terraform
	terraform $@ $(VARS)
