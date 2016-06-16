pull:
	docker pull nginx:1.9.0
	docker pull php:5.6-fpm
	docker pull redis:3.2


dl:
	wget https://getcomposer.org/composer.phar -O php/composer.phar

build:
	make build-nginx
	make build-mysql
	make build-php

build-nginx:
	docker build -t verystar/nginx ./nginx

run-nginx:
	docker run -i -d -p 80:80 -v ~/wwwroot:/data -t verystar/nginx

in-nginx:
	#docker run -i -p 80:80 -v ~/wwwroot:/data -t verystar/nginx /bin/bash
	docker exec -it verystar_nginx /bin/bash

build-php:
	docker build -t verystar/php ./php

run-php:
	docker run -i -d -p 9000:9000 -v ~/wwwroot:/data -t verystar/php

in-php:
	#docker run -i -p 9000:9000 -v ~/wwwroot:/data -t verystar/php /bin/bash
	docker exec -it verystar_php /bin/bash

build-mysql:
	docker build -t verystar/mysql ./mysql

run-mysql:
	docker run -i -d -p 3306:3306 -v ~/wwwroot/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t verystar/mysql

in-mysql:
	#docker run -i -p 3306:3306  -v ~/wwwroot/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t verystar/mysql /bin/bash
	docker exec -it verystar_mysql /bin/bash

clean:
	docker rmi -f $(shell docker images | grep "<none>" | awk "{print \$3}")