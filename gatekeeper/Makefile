# Some simple testing tasks (sorry, UNIX only).

create:
	@docker stack deploy gatekeeper -c stack-gatekeeper.yml

remove:
	@docker stack rm gatekeeper

logs:
	@docker service logs gatekeeper_traefik

.PHONY: create remove logs
