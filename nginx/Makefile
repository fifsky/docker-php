NAMESPACE=fifsky
APP=nginx
TAG=1.9

build:
	docker build --no-cache=true -t ${NAMESPACE}/${APP}:${TAG} .
run:
	docker run --name=${APP} -i -d -p 80:80 -v ~/wwwroot:/data -p ./nginx/conf/vhost.d:/etc/nginx/conf.d -t ${NAMESPACE}/${APP}:${TAG}

clean:
	docker stop ${APP} && docker rm ${APP}
reset: clean
	docker rmi ${NAMESPACE}/${APP}:${TAG}
interactive:
	docker run --rm --interactive --tty --name=${APP} ${NAMESPACE}/${APP} bash
push:
	docker push ${NAMESPACE}/${APP}:${TAG}