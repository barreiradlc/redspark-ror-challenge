CONTAINER_NAME ?= web
 
up:
	docker compose up

rspec:
	docker compose run --rm web rspec

migrate:
	docker compose run --rm web rails db:migrate

down:
	docker compose down
 
shell:
	@docker exec -it $(CONTAINER_NAME) \
	sh -c "/bin/bash || /bin/sh"
 
clean:
	@docker compose down
	@docker system prune --volumes --force
	@docker network prune
	@rm -rf tmp/* || sudo rm -rf tmp/*
	@mkdir -p tmp/pids && touch tmp/pids/.keep
