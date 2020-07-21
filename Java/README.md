# Java

## Add internal Certificate Authority (CA) to Java trust

````bash

# List CA's
keytool -keystore "$JAVA_HOME\jre\lib\security\cacerts" -storepass changeit -list

# Add CA to trust (this command will also create a new trust store)
keytool -import -alias susan -file Example.cer -keystore myTrustStore

# Test SSL connection (Source: https://github.com/mscatdk/java/tree/master/SSLShake)
java -jar SSLShake [hostname] [port]

# Trust store and password can be specified as follows
java -Djavax.net.ssl.trustStore=myTrustStore -Djavax.net.ssl.trustStorePassword=demodemo -jar SSLShake [hostname] 443

The trustStore password is needed to add new trust entries to the keystore and validate the integrity of the keystore. The trustStore password should be protected.
````

## Class loader

This Section is dedicated to topics related to the class loader.

## Logging

Class loader logging can be enabled by adding the below JVM option. This will allow you to identify the source for all classes loaded. A log entry will be created each time a class is loaded including origin and full class name. The log will only go to std out.

````bash
-verbose:class
````

## WebLogic

### Build WebLogic full client

````bash
# Use the following steps to create a wlfullclient.jar file for a JDK 1.7 client application:

# 1. Change directories to the server/lib directory. 
cd WL_HOME/server/lib

# 2. Use the following command to create wlfullclient.jar in the server/lib directory: 
java -jar wljarbuilder.jar

# 3. You can now copy and bundle the wlfullclient.jar along with cryptoj.jar with client applications. The wlfullclient.jar and cryptoj.jar must be kept in the same directory as the wlfullcient.jar references cryptoj.jar in its manifest Class-Path.

# 4. Add the wlfullclient.jar to the client application's classpath.

# 5. Install jar in local repository:

mvn install:install-file -Dfile=[path-to-file]

# source: <https://docs.oracle.com/cd/E24329_01/web.1211/e24378/jarbuilder.htm#SACLT239>
````

## JMX remote

Add the following JVM option to allow remote JMX access:

````bash
-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=5000 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false'
````

## Heap dump

````bash
jmap -dump:live,format=b,file=[File path] [Java PID]​
````

## Maven

Maven related topics

### Create simpel project using a template

````bash
mvn archetype:generate -DgroupId=[project group id] -DartifactId=[project name] -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
````

### Download from NEXUS repository

````bash
wget -O /tmp/servlet3.war "http://127.0.0.1:8081/nexus/service/local/artifact/maven/redirect?r=snapshots&g=com.msc.web&a=servlet3&v=0.0.1-SNAPSHOT&p=war"
````

### Run build without test

````bash
# Preferred
mvn clean install -DskipTests

# Skip test and compilation of test
mvn clean install -Dmaven.test.skip=true
````

### Encrypt passwords in settings.xml

````bash
# Encrypt master password
mvn --encrypt-master-password <password>
````

Create the file ${user.home}/.m2/settings-security.xml with the content

````xml
<settingsSecurity>
  <master>{jSMOWnoPFgsHVpMvz5VrIt5kRbzGpI8u+9EF1iFQyJQ=}</master>
</settingsSecurity>
````

````bash
# Encrypt password
mvn --encrypt-password <password>
````
