# Some simple testing tasks (sorry, UNIX only).

create:
	@docker stack deploy services -c stack-services.yml

remove:
	@docker stack rm services

.PHONY: create remove
