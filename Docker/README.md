# Docker

## Managing Containers

````bash

# Remove all stopped containers
docker rm $(docker ps -a -q)

# Save and load images as tar files
docker save [container name] > /path/to/file.tar

docker load /path/to/file.tar

#Commit manually updated image
docker commit [image ID] [NAME]:[TAG]

# Auto restart container
#Enable
docker run -d --restart always [NAME]:[TAG]

#Disable
docker update --restart=no [container ID]

#Copy file into container
docker cp file.txt [container ID]:/container/path/to/file

#Enter running container
docker exec -i -t [container ID] /bin/bash

#Add entries to host file
docker run --add-host="elastic.msc.local:10.0.0.201" [Image]

#Map file into container
docker run -v $(pwd)/demo.conf:/root/config/fluent-bit.conf [Image]

#Clean system for all images and containers not needed
docker system prune -a

#Remove containers based on pattern
docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi

# Overridde entrypoint
docker run --entrypoint "/bin/sh" [Image]

# Run local script inside container
docker run -it --rm -v $(pwd):/script [Image] /script/[script name]
````

## Enable Experimenal

Add the below to your .docker/config.json file

````json
"experimental": "enabled"
````

## Docker Manifest

````bash
# Create and push amd64 image
docker build . --tag mscatdk/openvpn-amd64:latest
docker push mscatdk/openvpn-amd64:latest

# Create and push armv6 image
docker build . --tag mscatdk/openvpn-armv6:latest
docker push mscatdk/openvpn-armv6:latest

# Create and push Manifest
docker manifest create mscatdk/openvpn:latest mscatdk/openvpn-amd64:latest mscatdk/openvpn-armv6:latest
docker manifest push mscatdk/openvpn:latest
docker manifest inspect mscatdk/openvpn
````

## Docker registry

### Protocol

````bash
# List images
curl -X GET http://[hostname]:[port]/v2/_catalog

# List tages for a specific image
curl -X GET http://[hostname]:[port]/v2/[image name]/tags/list
````

### Self-signed certificates

Add certificate e.g. a self-signed certificate

````bash
mkdir /etc/docker/certs.d/[hostname]:[port]

cp cert.crt /etc/docker/certs.d/[hostname]:[port]/ca.crt
````

### Insecure registry

Insecure registries can be allowed by runnig the below command

````bash
echo '{ "insecure-registries":["[hostname]:[port]"] }' >> /etc/docker/daemon.json
````

## Docker build

````bash
# make sure root login is disabled
RUN sed -i -e 's/^root::/root:!:/' /etc/shadow
````
