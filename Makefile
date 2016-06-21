init:
	apt install git default-jdk php
	apt install php-xml php-curl php-zip php-mcrypt php-mbstring
	pecl install redis
	mkdir -p ~/wwwroot/log/nginx
	mkdir -p ~/wwwroot/log/php
	mkdir -p ~/wwwroot/log/supervisor
	mkdir -p ~/wwwroot/data/ssdb
	mkdir -p ~/wwwroot/xdebug/profiler
	mkdir -p ~/wwwroot/xdebug/trace
	chown $(whoami):$(whoami) -R ~/wwwroot/log
	chown $(whoami):$(whoami) -R ~/wwwroot/data
	chown $(whoami):$(whoami) -R ~/wwwroot/xdebug
	wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer
	chmod +x /usr/local/bin/composer
	composer config -g repo.packagist composer https://packagist.phpcomposer.com
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

up:
	docker-compose up -d ${m}

stop:
	docker-compose stop ${m}

rm:
	docker-compose rm --all

start:
	docker-compose start ${m}

restart:
	docker-compose restart ${m}

build:
	docker-compose build --no-cache ${m}

rebuild:
	make stop ${m}
	make rm ${m}
	make build ${m}

ps:
	docker ps -a

clean:
	docker rmi $(sudo docker images -q -f "dangling=true")

bash:
	docker exec -it ${m} /bin/bash