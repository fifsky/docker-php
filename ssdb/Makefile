NAMESPACE=verystar
APP=ssdb
TAG=1.9.0

build:
	docker build --no-cache=true -t ${NAMESPACE}/${APP}:${TAG} .
run:
	docker run --name=${APP} -i -d -p 8888:8888 -v ~/wwwroot:/data -t ${NAMESPACE}/${APP}:${TAG}
clean:
	docker stop ${APP} && docker rm ${APP}
reset: clean
	docker rmi ${NAMESPACE}/${APP}:${TAG}
interactive:
	docker run --rm --interactive --tty --name=${APP} ${NAMESPACE}/${APP} bash
push:
	docker push ${NAMESPACE}/${APP}:${TAG}