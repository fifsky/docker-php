NAMESPACE=verystar
APP=supervisor
TAG=2.7

build:
	docker build --no-cache=true -t ${NAMESPACE}/${APP}:${TAG} .
run:
	docker run --name=${APP} --detach=true -t ${NAMESPACE}/${APP}:${TAG}
clean:
	docker stop ${APP} && docker rm ${APP}
reset: clean
	docker rmi ${NAMESPACE}/${APP}:${TAG}
interactive:
	docker run --rm --interactive --tty --name=${APP} ${NAMESPACE}/${APP} bash
push:
	docker push ${NAMESPACE}/${APP}:${TAG}