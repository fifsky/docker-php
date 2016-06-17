dl:
	wget https://getcomposer.org/composer.phar -O php/composer.phar

up:
	docker-compose up -d

stop:
	docker-compose stop

rm:
	docker-compose rm --all

start:
	docker-compose start

restart:
	docker-compose restart

build:
	docker-compose build --no-cache

rebuild:
	make stop
	make rm
	make build

clean:
	docker rmi $(docker images -q -f "dangling=true")

bash:
	docker exec -it ${m} /bin/bash