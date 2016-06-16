NAMESPACE=verystar
APP=redis
TAG=3.2

build:
	docker build --no-cache=true -t ${NAMESPACE}/${APP}:${TAG} .
run:
	docker run --name=${APP} --detach=true -i -d -p 6379:6379 -v ~/wwwroot:/data -t ${NAMESPACE}/${APP}:${TAG}
clean:
	docker stop ${APP} && docker rm ${APP}
reset: clean
	docker rmi ${NAMESPACE}/${APP}:${TAG}
interactive:
	docker run --rm --interactive --tty --name=${APP} ${NAMESPACE}/${APP} bash
push:
	docker push ${NAMESPACE}/${APP}:${TAG}