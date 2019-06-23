IMAGE=mscatdk/animal


.PHONY: build, run
default: build

build:
	docker build . --tag ${IMAGE}:dog --build-arg STATIC_RESOURCE=dog.html
	docker build . --tag ${IMAGE}:cat --build-arg STATIC_RESOURCE=cat.html

run:
	docker run -d --rm -p 7001:80 ${IMAGE}:dog
	docker run -d --rm -p 7002:80 ${IMAGE}:cat
