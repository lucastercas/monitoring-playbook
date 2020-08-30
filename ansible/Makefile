.PHONY: install-requirements install-role run-playbook

run:
	@docker run --rm -ti \
		-w /opt/app \
		-v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		-v ~/.ssh/id_rsa.pub:/root/ssh/id_rsa.pub \
		-v $(CURDIR):/opt/app \
		lucastercas/ansible \
			ansible-playbook -i inventories/cluster-nodes.yml $(playbook).yml -v

install-requirements:
	@docker run --rm -it \
		-w /opt/app \
		-v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		-v ~/.ssh/id_rsa.pub:/root/ssh/id_rsa.pub \
		-v $(CURDIR):/opt/app \
		lucastercas/ansible ansible-galaxy install -r requirements.yml

install-role:
	@docker run --rm -it \
		-w /opt/app
		-v $(CURDIR):/opt/app \
		lucastercas/ansible ansible-galaxy install role $(role)
