# j-lawyer.org Developer Quickstart

Repository with documentation, scripts and tools for building all sub projects. No source code in this repository that will end up in any release.

## Quickstart: 
 
### Prepare environment

* install Java 11 JDK (suggest to use Liberica JDK 11: https://bell-sw.com/pages/downloads/#/java-11-lts)
* install Netbeans IDE (https://netbeans.apache.org/) - the repositories have project definitions for this IDE, and the j-lawyer.org client is largely built using Netbeans' GUI builder
* install MariaDB
* install "ant" - either download from the apache.org directly, or - on Linux with apt - type 'sudo apt-get install ant'
* download and unpack http://www.j-lawyer.org/downloads/j-lawyer-developer-quickstart/wildfly.tar.gz
* edit "standalone.xml" in wildfly-16.0.0.Final/standalone/configuration and update the MySQL root password (search for jlawyerdbpwd in the file)
* in Netbeans, configure Wildfly server so you can start / stop / debug it from within Netbeans (http://www.mastertheboss.com/eclipse/jboss-netbeans/configuring-netbeans-with-wildfly/)

### Build the application

* Clone repository j-lawyer-org to your local disk. When cloning directly from within Netbeans ("Team" - "Remote" - "Clone"), Netbeans will automatically scan for projects and open them.
* run build-fast.sh in repository j-lawyer-org to build the applications, skipping tests

### Running tests

* In contrast to build-fast.sh, build.sh will also run the automated tests.

### Set up a new development database

* run j-lawyer-org/j-lawyer-server/setup/create_database.sql in a MySQL prompt or frontend
This will create an empty j-lawyer.org database with users admin/a and user/u

### Deploy the server

* once the build ran successfully, take j-lawyer-server.ear from j-lawyer-org/j-lawyer-server/dist/ and put it in wildfly-16.0.0.Final/standalone/deployments - this will install the server binaries
* Linux / macOS: launch the server with: sh wildfly-16.0.0.Final/bin/standalone.sh -c standalone.xml -b 0.0.0.0 (or start it from within the IDE, in the "Services" tab under "Servers")
* Windows: launch the server with: wildfly-16.0.0.Final/bin/standalone -c standalone.xml -b 0.0.0.0 (or start it from within the IDE, in the "Services" tab under "Servers")
* run 'java -jar j-lawyer-client.jar' in j-lawyer-org/j-lawyer-client/dist to run the client (or start it from within the IDE, by right-clicking "j-lawyer-client" projekt and choosing "Run")

**Questions: reach out to info (-at-) j-lawyer.org - we will provide support to anyone considering to support the project. Word!** 

### Hints

n/a
