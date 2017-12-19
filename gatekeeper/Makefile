# Some simple testing tasks (sorry, UNIX only).

start:
	@docker stack deploy gatekeeper -c stack-gatekeeper.yml

stop:
	@docker stack rm gatekeeper

logs:
	@docker service logs gatekeeper_traefik

.PHONY: create remove logs
