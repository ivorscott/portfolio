#!make

build:
	@echo "\n[ build portfolio production image ]"
	docker build --tag ivorsco77/portfolio .

login:
	@echo "\n[ log into private registry ]"
	cat ./secrets/registry_pass | docker login --username `cat ./secrets/registry_user` --password-stdin

publish: login
	@echo "\n[ publish production grade image ]"
	docker push ivorsco77/portfolio

deploy:	login
	@echo "\n[ startup production stack ]"
	@docker stack deploy --with-registry-auth -c docker-stack.yml ivorscott-portfolio
	@echo "\n"