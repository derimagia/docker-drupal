.PHONY: build force-build up down restart clean-containers clean-images clean-volumes clean open

build:
	docker-compose build

force-build:
	docker-compose build --no-cache

up:
	docker-compose up

down:
	docker-compose stop

open:
	open 'http://'`docker-machine ip`

in:
	command docker exec -it `docker ps | grep _ngnix | awk '{print $$1}'` /bin/sh

restart:
	docker-compose restart

clean: clean-containers clean-images clean-volumes

clean-containers:
	command docker ps -aqf status=exited | xargs -r docker rm -v

clean-images:
	command docker images -aqf dangling=true | xargs -r docker rmi

clean-volumes:
	command docker volume ls -qf dangling=true | xargs -r docker volume rm

default: build
