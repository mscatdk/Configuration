# Docker

## Managing Containers
Remove all stopped containers
````bash
docker rm $(docker ps -a -q)
````

Save and load images as tar files
````bash
docker save [container name] > /path/to/file.tar

docker load /path/to/file.tar
````

Commit manually updated image
````bash
docker commit [ID] [NAME]:[TAG]
````

## Docker registry
Add certificate e.g. a self signed certificate
````bash
mkdir /etc/docker/certs.d/[hostname]:[port]

cp cert.crt /etc/docker/certs.d/[hostname]:[port]/ca.crt
````
