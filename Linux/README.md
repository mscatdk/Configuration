# Linux

This page contain Linux related information.

## Commands

```bash
# Generate a random number between 5 and 10 both included
 shuf -i 5-10 -n 1

# Delete all files older than 1 day
find /path/to/files* -mtime +1 -exec rm {} \;

# Print commands in script before they are executed
bash -x [script name]

# Delete all files except the 4 created latest
ls -t | tail -n +4 | xargs rm --

# Use nmap to scan IP range for machines with port 22 open
 nmap -sV -p [port] 10.0.0.1-255

# Check if a file is using CRLF line endings by counting the number of CRLF entries
grep -U $'\x0D' $in | wc -l
```

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

## Check if port is open
```bash
(echo >/dev/tcp/{host}/{port}) &>/dev/null && echo "open" || echo "close"
```

## Bash

Check syntax

```bash
sudo apt-get install -y shellcheck

shellcheck [filename]
```

Run for loop X times where X is given by a variable

```bash
#!/bin/bash

# Run for loop X times where X is given by a variable
for i in $(seq 1 $X); do echo $i; done
```

Infinite loop

```bash
#!/bin/bash
while true
do
    echo "Press [CTRL+C] to stop.."
    sleep 1
done
```

Execute command for each line in a text file

```bash
# The file name must be provided as the first argument
#!/bin/bash

cat $1 | while read in
do
     echo "$in"​
done
```

If statement

```bash
#!/bin/bash

if [ $foo -gt 3 ]
then
     [command]
fi
```

Fail on first command returning a non-zero return code
```bash
#!/bin/bash

set -e
[command 1]
[command 2]
[command 3]
[command 4]
set +e
```

### Date manipulation

```bash
# Current date + 10 days
date -d "+10 days"

# Given date + 10 days
todate=$(date -d 2019-02-01+10days)

# compare dates
todate=$(date -d 2019-02-01 +%s)
cond=$(date -d 2018-12-19 +%s)

if [ $todate -ge $cond ];
then
    echo larger
fi
```

### Log files

```bash
# Rotate a log file and keep the 7 latest version without compression
savelog -l -n -c 7 [log file path]
```

### sed command

The file data.xml contain

```xml
<note>
     <to>Tove</to>
     <from>Jani</from>
     <heading>
          <h1>20px</h1>
          <h2>36px</h2>
     </heading>
     <body>
          <master>m1</master>
          <slave>s1</slave>
     </body>
     <body>
          <master>m2</master>
          <slave>s2</slave>
     </body>
</note>
```

```bash
# Remove tag without knowing the value
sed -i '/<from>.*<\/from>/d' data.xml

# Remove text between two markers
sed -i '/<heading>/,/<\/heading>/d' data.xml

# Replace text placed on two lines
sed -i '/<body>.*/{N; s/<body>.*<master>m1<\/master>/<body>\n\t<master>test<\/master>/g}' data.xml

# Return only the file between <demo> and </demo> (Including both tags)
sed -n '/<demo*/,/<\/demo>/p' [path to file]
```

The file will contain the following post executing the above commands

```xml
<note>
     <to>Tove</to>
     <body>
          <master>test</master>
          <slave>s1</slave>
     </body>
     <body>
          <master>m2</master>
          <slave>s2</slave>
     </body>
</note>
```

## GDB

Kill java thread using GDB

```bash
# Run jstack to get thread id
jstack -l [process id]

# Locate the thread and save the nid. The nid is 0x271a in the below example
"Thread-0" #8 prio=5 os_prio=0 tid=0x00007fb69c1a0800 nid=0x271a waiting on condition [0x00007fb68418e000]
   java.lang.Thread.State: TIMED_WAITING (sleeping)
        at java.lang.Thread.sleep(Native Method)
        at com.mscatdk.test.MyThread.run(MyThread.java:9)
        at java.lang.Thread.run(Thread.java:748)

   Locked ownable synchronizers:
        - None

# Convert the nid to decimal
echo $((16#[nid number]))

# Attach GDB to the process
gdb -p [process id]

# Run the below command and use the decimal nid number to identify the thread look for (LWP 10002)
info threads

# Move into the thread
thread [gdb thread id]

# Call thread close
call pthread_exit()
```

Close socket in running application

```bash
# Find process id
netstat -lnp | grep [port]

# Find device
lsof -np [process id]

# Look for NODE: TCP and name containing the port number
java    10619 vagrant    6u  IPv6             799322      0t0    TCP *:9999 (LISTEN)

# Map device to file descriptor
ls -lrt /proc/[process id]/fd

# Attach to process with gdb
gdb -p [process id]

# call close on file descriptor
call shutdown([file descriptor],2)
```

## Network

### Bridge

```bash
# Control whether or not packets traversing the bridge are sent to iptables for processing.
echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
```

### tc

The following commands can be used to simulate network delays and errors. Please see the full list here: <https://wiki.linuxfoundation.org/networking/netem>

```bash
# Adds a fixed amount of delay to all packets going out of the local Ethernet
tc qdisc add dev eth0 root netem delay [delay in ms]ms

# Ramdom delay in the range [base] ms +- [range]ms
tc qdisc change dev eth0 root netem delay [base]ms [range]ms
```

### SimpelHTTPServer

```bash
# Serve files from current directory
python -m SimpleHTTPServer [port]
```

### ngrep

```bash
# Install ngrep
sudo apt-get install ngrep

# Listen for HTTP GET and POST on port [port]
ngrep -l -q -i "^GET |^POST " tcp and port [port]
```

### HTTPie

```bash
# Install HTTPie
sudo apt-get install httpie
# or
brew install httpie

# HTTP GET Request
http GET google.com
```

### ipcalc

```bash
# Convert cidr notation to ip range
ipcalc [cidr]
```

### nsenter

```bash
# Create a docker contianer with a process listning on localhost
sudo docker run --rm alpine nc -l 127.0.0.1 -p 5000

# Obtain container pid
sudo docker inspect -f '{{.State.Pid}}' [container id]

# Enter the network namespace (-m can be added to enter the filesystem)
sudo nsenter -t [docker pid] -n /bin/sh

# Validate
echo "validate" | nc -v 127.0.0.1 5000
```

### arp

```bash
# Show ARP table
arp
```

### p0f

```bash
# Installation
sudo apt-get install p0f

# Log connections + OS
sudo p0f -i [interface] -p -o /tmp/p0f.log
```

### IPVS Based load balancer

```bash
# Installation
sudo apt-get install ipvsadm

# Create round robin tcp load balancing service
sudo ipvsadm -A -t [LB ip]:[LB port] -s rr

# List services
sudo ipvsadm -l -n

# Add hosts to the service
sudo ipvsadm -a -t [LB ip]:[LB port] -r [service ip] -m

# You can now test the load balancer (assuming HTTP service)
curl [LB ip]:[LB port]

# Delete the load balancing service
sudo ipvsadm -D -t [LB ip]:[LB port]
```

### DNS

The DNS server can be configured by updating /etc/resolv.conf. The file may get overwritten on some systems by the network configuration manager.

```bash
nameserver [IP Address]
```

Example nameserver 8.8.8.8

### Proxy

The CLI proxy is configured by setting the following environment variables

```bash
export http_proxy="http://[user]:[password]@[host]:[port]"
export https_proxy="http://[user]:[password]@[host]:[port]"
```

### Dynamic Socket

A dynamic socket proxy can be created using SSH as follows:

````bash
ssh -D 8080 -N [user]@[hostname]
export http_proxy=socks5://[host]:[port]
export https_proxy=socks5://[host]:[port]
````

### Route

#### Default Gateway

The default gateway is set using one of the following commands:

````bash
ip route add default via [IP Address]
sudo route add default gw [IP Address] [Interface]
````

One example could be sudo route add default gw 192.168.1.254 eth0

#### Show routing table

````bash
route -n
ip route show
````

#### Add and remove static route

````bash
sudo route add [IP Address] gw [Gateway IP] [Interface]
sudo route del [IP Address] gw [Gateway IP] [Interface]
````

#### Display the route to a given IP

````bash
ip route get [IP Address]
ip route get [IP Address] from [Source IP]
# You may need to install the traceroute package to run the following command
traceroute [IP Address]
````

#### netstat

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

## Mounts

### Virtual mount

````bash
mkdir -p /quota

mkdir -p /usr/disk-img

# Create 20M file (disk image)
dd if=/dev/zero of=/usr/disk-img/disk-quota.ext3 count=40960
# Format the image as an ext3 filesystem
/sbin/mkfs -t ext3 -q /usr/disk-img/disk-quota.ext3 -F

# Mount the filesystem
mount -o loop,rw,usrquota,grpquota /usr/disk-img/disk-quota.ext3 /quota
````

## SSH

### Convert Putty keypair (ppk) to SSH agent keypair

1. Run puttygen [ppk key file] -O private-openssh -o id_dsa
2. Go to Conversions->Export OpenSSH

### Using a specific keyfile for a specific hostname

Add the following to ~/.ssh/config

````bash
Host host1
  HostName <hostname_or_ip>
  IdentityFile ~/.ssh/identity_file1

Host Host2
  HostName <hostname_or_ip2>
  User differentusername
  IdentityFile ~/.ssh/identity_file2
````

You can alternatively provide the private key using the -i option.

````bash
ssh [hostname] -i [key path]
````

### Run multiple commands on remote server

````bash
ssh host /bin/bash << EOF
[command 1]
[command 2]
[command 3]
EOF
````

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

## User and groups

### Users

````bash
#Create a user with a specific home directory
useradd -m -d /home/directory [username]

#Add existing user to group
usermod -a -G [group name] [username]

#Change users default shell
usermod -s /usr/bin/git-shell [username]

#Lock account
passwd -l [username]
````

### Groups

````bash
#Create group
groupadd [group name]

#Delete group
groupdel [group name]
````

### sudoers

````bash
# Edit file (location: /etc/sudoer)
visudo

# Allow all without password
[username] ALL=(ALL) NOPASSWD: ALL

# Allow list of commands
[username] ALL=(ALL) NOPASSWD: /bin/kill, /bin/rm
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

## tcpdump

````bash
#Listen on localhost
sudo tcpdump -i lo

#Listen on interface with mac package size
tcpdump -i <interface> -s 65535 -w <some-file>

#Read pcap file
tcpdump -qns 0 -X -r file.pcap
````

## mitmproxy

mitmproxy is your swiss-army knife for debugging, testing, privacy measurements, and penetration testing.

````bash
# Install
apt-get install mitmproxy

# Run mitmproxy
mitmproxy

# Press q to exit

# The mitmproxy root CA certificate is located here
cat ~/.mitmproxy/mitmproxy-ca-cert.cer

# Run mitmproxy
mitmproxy

# Update the client e.g. Firefox to use the proxy and trust the root CA
````

## Wireshark

### Split and Merge

### Process multiple files

### Display filters

````bash
#Filter on port
tcp.port == [port]

#Filter on flags e.g. ACK, RST, and FIN
tcp.flags.ack==1 || tcp.flags.reset==1 || tcp.flags.fin==1

#Search for string
tcp and frame contains "[pattern]"

#Filter based on IP
ip.addr == [ip]

#HTTP request method
http.request.method == "POST"
````

## strace

````bash
#Monitor exisitng process with PID=$PID
strace -p $PID -f -e trace=network -s 10000

#strace with selected calls
strace -t -f -e socket,bind,getsockname,getsockopt,connect,epoll_ctl,epoll_wait -p $PID
````

## AWK

````bash
# Print third column
ls -lrt | awk '{print $3}'

# sum column
seq 1 20 | awk '{sum += $1} END {print sum}'

# Change seperator
echo "demo|print me|test" | awk -F '|' '{print $2}'

# Conditional sum
awk -F '|' '{a[$1] += $3} END{for (i in a) print i, a[i]}' filename.txt
````

## cURL

````bash
#cURL using e.g. tor proxy assuming it's running on 9150
curl --socks5-hostname localhost:9150 https://check.torproject.org
````

## File permission

````bash
# Get file permission as octal string
stat -c "%a %n" *
````

## Fail2ban

````bash
#Get Status for jail e.g. ssh
sudo fail2ban-client status [JAIL]

# unban ip
sudo fail2ban-client set [JAIL] unbanip [IP address]
````

## tar GZip

````bash
# Create Archive
tar -cvzf archive.tar.gz /path/to/files/*

# Unpacking
gunzip archive.tar.gz

tar -xvf archive.tar
````

## iptables

````bash
# List existing rules
iptables -S

# List with line number
iptables -L --line-numbers

# Allow only 1.2.3.4 to access port 7426
iptables -A INPUT -p tcp --dport 7426 -s 1.2.3.4 -j ACCEPT
iptables -A INPUT -p tcp --dport 7426 -j DROP

# Flush all rules
iptables -F

# Delete by line number
iptables -D INPUT [line number]

## Full example

# Default policies
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Allow INBOUND traffic
# Lookback traffic
iptables -A INPUT --in-interface lo -j ACCEPT

# Allow SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow response traffic
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Redirect from one port to another
iptables -t nat -A PREROUTING -p tcp --dport [Source port] -j REDIRECT --to-ports [target port]

# Forward traffic assuming no nat table rules for chain PREROUTING and POSTROUTING.
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -s [Source IPs] -p tcp --dport [Source port] -j DNAT --to-destination [Target IP]:[Target port]
sudo iptables -t nat -A POSTROUTING -p tcp -d [Target IP] --dport [Target port] -j SNAT --to-source [machine ip on source network]
````

### iptables-save

````bash
# install package
apt-get install iptables-persistent

# Save iptable content IPv4
iptables-save > /etc/iptables/rules.v4

# Restore iptable IPv4
iptables-restore < /etc/iptables/rules.v4
````

## Debian package systems

````bash
# List files created by a given package
dpkg-query -L [package name]
````

## Program Interpreter

The run time linker of a given program can be identified using the following command

````bash
readelf -l [Executable] | grep "program interpreter"
````

You may need to install the dependency in case it doesn't exist on your system.

## Glusterfs

````bash
# List all volumes
gluster volume list

# Volume information
gluster volume info

#Details about a given volume
gluster volume status [Volume name]

# Client information
gluster volume status [Volume name] clients

# Peer status
gluster peer status

# mount volume
 mount -t glusterfs [Hostname]:/[Volume name] [PATH]
````

## Fluentbit

* Please see: <http://fluentbit.io/>
* Test filter here: <http://rubular.com/r/3KgVUrL1iz>

## Certificates

### cert-bot

````bash
# Create certificates
certbot-auto certonly --webroot -w /var/www/example.com -d example.com

# renew certificates
certbot-auto renew
````

## Others

## File tree

````bash
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
````

## Alpine

### Install software

````bash
# Install bash
apk add bash

# Install latest version from specific repository
apk add --update bash --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

# Install gcc
apk add libc-dev
apk add gcc
````

### User and Groups

````bash
# Create group
addgroup -S [Group name]

# Create user
adduser -S [user name] -G [group name]
````

## Makefile

````make
IMAGE=mscatdk/hello.docker
TAG=latest

.PHONY: dev, build, run
default: dev

dev:
	mvn clean install
	java -jar target/*-jar-with-dependencies.jar

build:
	docker build . --tag ${IMAGE}:${TAG}

run:
	docker run -d --rm -p 9090:9090 ${IMAGE}:${TAG}
````

## gcc

````bash
# Statically link
gcc -static src.c obj.o -o prog
````bash

## ps

````bash
# Get process group id
ps xao pid,ppid,pgid,sid,command | head
````

## Avoid adding command to history

````bash
# Ensure all command executed with a space in front aren't written to history
export HISTCONTROL=ignorespace
# Add a space to exclude the command from history
 echo <secret>
````

## Enter password

````bash
# The following will work for bash
read -s PASSWORD
echo $PASSWORD

# General approach
stty_orig=$(stty -g)
stty -echo
read password
stty $stty_orig
````

## Alternatives

````bash
# Install the maven alternative
update-alternatives --install /usr/bin/mvn mvn /opt/maven/apache-maven-3.5.0/bin/mvn 100
````
