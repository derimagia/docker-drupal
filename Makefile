.PHONY: build up down restart clean-containers clean-images clean-volumes clean open

build:
	docker-compose build --no-cache

up:
	docker-compose up

down:
	docker-compose stop

open:
	open 'http://'`docker-machine ip`

in:
	docker exec -it `docker ps | grep _ngnix  | awk '{print $$1}'` /bin/sh

restart:
	docker-compose restart

clean: clean-containers clean-images clean-volumes

clean-containers:
	docker ps -aqf status=exited | xargs docker rm -v

clean-images:
	docker images -aqf dangling=true | xargs docker rmi

clean-volumes:
    docker volume ls -qf dangling=true | xargs docker volume rm

default: build
