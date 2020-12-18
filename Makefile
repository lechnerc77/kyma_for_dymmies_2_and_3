RELEASE=0.0.1
APP=safeapp
DOCKER_ACCOUNT=<YOUR_DOCKER_ID>
CONTAINER_IMAGE=${DOCKER_ACCOUNT}/${APP}:${RELEASE}

.PHONY: build-image push-image

build-image:
	docker build -t $(CONTAINER_IMAGE) --no-cache --rm .

push-image: build-image
	docker push $(CONTAINER_IMAGE)

docker-run:
	docker run -p 2222:1111 $(CONTAINER_IMAGE)