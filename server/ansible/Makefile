.PHONY: ping run-playbook update dnscat2
ARGS=-i inventory
ARGS+= -e @private.yml
ARGS+= -v
FEATURES=dnscat2 nmapdiff

inventory:
	make -s -C ../terraform ip > $@

.bootstrap: inventory
	ssh root@$(shell cat inventory) apt-get -y install python
	ansible-playbook $(ARGS) -u root bootstrap.yml
	ssh root@$(shell cat inventory) passwd $(USER)
	touch .bootstrap

update:
	ansible-playbook $(ARGS) -u root update.yml

setup: .bootstrap
	ansible-playbook $(ARGS) user.yml
	ansible-playbook $(ARGS) -u root ptf.yml

$(FEATURES):
	ansible-playbook $(ARGS) -u root $@.yml

ping: inventory .bootstrap
	ansible all $(ARGS) -m ping

features: $(FEATURES)

list-features:
	@echo $(FEATURES)
