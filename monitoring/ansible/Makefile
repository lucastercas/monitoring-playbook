.PHONY: install-requirements install-role run-playbook

run-playbook:
	@docker run --rm -ti \
		-w /opt/app \
		-u ${UID}:${GID} \
		-v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		-v ~/.ssh/id_rsa.pub:/root/ssh/id_rsa.pub \
		-v $(CURDIR):/opt/app \
		lucastercas/ansible \
			ansible-playbook -i inventories/dev.yml site.yml -vvvv

install-requirements:
	@docker run --rm -it \
		-w /opt/app \
		--user ${UID}:${GID} \
		-v $(CURDIR):/opt/app \
		lucastercas/ansible \
			ansible-galaxy install -r requirements.yml

install-role:
	@docker run --rm -it \
		-w /opt/app
		-v $(CURDIR):/opt/app \
		lucastercas/ansible \
			ansible-galaxy install role $(role)

clean:
	rm -rf roles/geerlingguy.*
	rm -rf roles/lucastercas.*
	rm -rf *.retry