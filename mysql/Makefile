NAMESPACE=fifsky
APP=mysql
TAG=5.7

build:
	docker build --no-cache=true -t ${NAMESPACE}/${APP}:${TAG} .
run:
	docker run --name=${APP} -i -d -p 3306:3306 -v ~/wwwroot/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t ${NAMESPACE}/${APP}:${TAG}

clean:
	docker stop ${APP} && docker rm ${APP}
reset: clean
	docker rmi ${NAMESPACE}/${APP}:${TAG}
interactive:
	docker run --rm --interactive --tty --name=${APP} ${NAMESPACE}/${APP} bash
push:
	docker push ${NAMESPACE}/${APP}:${TAG}