init:
	apt install git default-jdk
	mkdir -p ~/wwwroot/log/nginx
	mkdir -p ~/wwwroot/log/php
	mkdir -p ~/wwwroot/log/supervisor
	mkdir -p ~/wwwroot/data/ssdb
	wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer
	chmod +x /usr/local/bin/composer
	composer config -g repo.packagist composer https://packagist.phpcomposer.com

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