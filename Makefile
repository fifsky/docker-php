init:
	echo >> '116.228.41.178 git.verystar.cn' /etc/hosts
	apt install git default-jdk php
	apt install php-xml php-curl php-zip
	pecl install redis
	mkdir -p ~/wwwroot/log/nginx
	mkdir -p ~/wwwroot/log/php
	mkdir -p ~/wwwroot/log/supervisor
	mkdir -p ~/wwwroot/data/ssdb
	chown $(whoami):$(whoami) -R ~/wwwroot
	wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer
	chmod +x /usr/local/bin/composer
	composer config -g repo.packagist composer https://packagist.phpcomposer.com
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
	docker rmi $(sudo docker images -q -f "dangling=true")

bash:
	docker exec -it ${m} /bin/bash