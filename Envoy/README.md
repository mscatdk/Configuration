# Simple Envoy Configuration

Run the setup using the following command:

````bash
make run
````

The above command will do the following

1. The above command will create a self-signed certificate in ./certs in case the folder ./certs doesn't exist.
2. Start 3 docker containers
    * Envoy proxy
    * nginx
    * hello.docker

The envoy proxy can be reached on port 8000 (http) and 8443 (https). The http port will redirect to https. https://127.0.0.1:8443/hello.world/ will redirect to the nginx container on port 80, while https://127.0.0.1:8443/hello.docker/hello will redirect to the hello.docker container. The following requests should work

````bash
curl -k https://127.0.0.1:8443/hello.world/
curl -k https://127.0.0.1:8443/hello.docker/hello

# You should get a 301
curl -I http://127.0.0.1:8000/hello.world/
curl -I http://127.0.0.1:8000/hello.docker/hello
````