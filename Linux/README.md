# Linux
This page contain Linux related information.

## htpasswd
Create file and add user demo
```bash
htpasswd -c /path/to/file/.htpasswd demo
```
Add or update password for user demo
```bash
htpasswd /path/to/file/.htpasswd demo
```

Remove user demo from file
```bash
htpasswd -D /path/to/file/.htpasswd demo
```

## Find command
Delete all files older than 1 day
```bash
find /path/to/files* -mtime +1 -exec rm {} \;
```

## Network
### Gateway
The default gateway can be configured using the following command
```bash
sudo route add default gw [IP Address] [Adapter]
```
One example could be sudo route add default gw 192.168.1.254 eth0

### DNS
The DNS server can be configured by updating /etc/resolv.conf. The file may get overwritten on some systems by the network configuration manager.
```bash
nameserver 8.8.8.8
```

## Proxy
The CLI proxy is configured by setting the following environment variables
```bash
export http_proxy="http://user:password@host:port"
export https_proxy="http://user:password@host:port"
```

### Dynamic Socket
A dynamic socket proxy can be created using SSH as follows:
````bash
ssh -D 8080 name@myserver.com
export http_proxy=socks5://127.0.0.1:8080
export https_proxy=socks5://127.0.0.1:8080
````
### Default Gateway
The default gateway is set using one of the following commands:
````bash
ip route add default via 192.168.1.254
route add default gw {IP-ADDRESS} {INTERFACE-NAME}
````

## netstat
Find process listening on a specific port:

````bash
netstat -tulpn
````

## Random data service for virtual machines
The rng-tools package can be installed as follows:
````bash
apt-get install rng-tools
````
Next open /etc/default/rng-tools...

````bash
vi /etc/default/rng-tools
````
... and add the line HRNGDEVI

Now start the rng-tools daemon:
````bash
/etc/init.d/rng-tools start
````
## SSH

### SSH private key authentication
Create the SSH public and private key pair using the command on the client:
````bash
ssh-keygen -t rsa
````
Run the following command to append the key to the authorized_keys file on the server.
````bash
cat .ssh/id_rsa.pub | ssh userName@ServerIP 'cat >> .ssh/authorized_keys'
````
### Xauth
Get the keys and x-server adresse by running:

````bash
xauth list|grep uname -n echo $DISPLAY
````
And the xauth keys and set DISPLAY using the commands
````bash
xauth add $DISPLAY . hexkey
export DISPLAY=localhost:10.0
````

## Install Java 8
Run the following commands:
````bash
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
````

## VI
Get content in hex format
````bash
:%!xxd
````

Get back to text mode by typing

````bash
:%!xxd -r
````
