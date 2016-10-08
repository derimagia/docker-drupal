.PHONY: build force-build up down restart clean-containers clean-images clean-volumes clean open

build:
	docker-compose build

force-build:
	docker-compose build --no-cache

up:
	docker-compose up

down:
	docker-compose stop

restart:
	docker-compose restart

clean: clean-containers clean-images

clean-containers:
	command docker ps -aqf status=exited | xargs -r docker rm

clean-images:
	command docker images -aqf dangling=true | xargs -r docker rmi

clean-volumes:
	command docker volume ls -qf dangling=true | xargs -r docker volume rm

default: build
