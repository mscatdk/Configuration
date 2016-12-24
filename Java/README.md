# Java

## Maven

### Download from NEXUS repository
````bash
wget -O /tmp/servlet3.war "http://127.0.0.1:8081/nexus/service/local/artifact/maven/redirect?r=snapshots&g=com.msc.web&a=servlet3&v=0.0.1-SNAPSHOT&p=war"
````

### WebLogic

#### Build WebLogic full client

Use the following steps to create a wlfullclient.jar file for a JDK 1.7 client application:

1. Change directories to the server/lib directory.
cd WL_HOME/server/lib

2. Use the following command to create wlfullclient.jar in the server/lib directory:
java -jar wljarbuilder.jar

3. You can now copy and bundle the wlfullclient.jar along with cryptoj.jar with client applications. The wlfullclient.jar and cryptoj.jar must be kept in the same directory as the wlfullcient.jar references cryptoj.jar in its manifest Class-Path.

4. Add the wlfullclient.jar to the client application's classpath.

5. Install jar in local repository:
mvn install:install-file -Dfile=<path-to-file>

source: https://docs.oracle.com/cd/E24329_01/web.1211/e24378/jarbuilder.htm#SACLT239
