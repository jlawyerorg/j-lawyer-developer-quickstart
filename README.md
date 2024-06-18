# j-lawyer.org Developer Quickstart

Repository with documentation, scripts and tools for building all sub projects. No source code in this repository that will end up in any release.

## Quickstart: 
 
### Prepare environment

* install Java 17 JDK (suggest to use Liberica JDK 17: https://bell-sw.com/pages/downloads/#/java-17-lts)
* install Netbeans IDE (https://netbeans.apache.org/) - the repositories have project definitions for this IDE, and the j-lawyer.org client is largely built using Netbeans' GUI builder
* install MariaDB
* Linux: install "ant" - either download from the apache.org directly, or - on Linux with apt - type 'sudo apt-get install ant'
* Windows: download required tools from http://www.j-lawyer.org/downloads/j-lawyer-developer-quickstart/tools.zip and extract it
* download and unpack http://www.j-lawyer.org/downloads/j-lawyer-developer-quickstart/wildfly.tar.gz
* edit "standalone.xml" in wildfly-26.1.3.Final/standalone/configuration and update the MySQL root password (search for jlawyerdbpwd in the file)
* edit "standalone.xml" in wildfly-26.1.3.Final/standalone/configuration and set data directories (search for "jlawyer.server.basedirectory" and "jlawyer.server.initdir" in the file)
* in Netbeans, configure Wildfly server so you can start / stop / debug it from within Netbeans (http://www.mastertheboss.com/eclipse/jboss-netbeans/configuring-netbeans-with-wildfly/)

### Build the application

* Clone repository j-lawyer-org to your local disk. When on Windows, the top most folder "j-lawyer-org" should reside next to the "tools" folder you downloaded and extracted. When cloning directly from within Netbeans ("Team" - "Remote" - "Clone"), Netbeans will automatically scan for projects and open them.
* Linux: run build-fast.sh in repository j-lawyer-org to build the applications, skipping tests
* Windows: run build-windows.sh in Git Bash, followed by deploy-windows.sh (both located in folder "j-lawyer-org")

### Running tests

* In contrast to build-fast.sh, build.sh will also run the automated tests.

### Set up a new development database

* run j-lawyer-org/j-lawyer-server/setup/create_database.sql in a MySQL prompt or frontend
This will create an empty j-lawyer.org database with users admin/a and user/u

### Deploy the server

* once the build ran successfully, take j-lawyer-server.ear from j-lawyer-org/j-lawyer-server/dist/ and put it in wildfly-26.1.3.Final/standalone/deployments - this will install the server binaries. Scripts deploy.sh and deploy-windows.sh will take care of this.
* Linux / macOS: launch the server with: sh wildfly-26.1.3.Final/bin/standalone.sh -c standalone.xml -b 0.0.0.0 (or start it from within the IDE, in the "Services" tab under "Servers")
* Windows: launch the server with: wildfly-26.1.3.Final/bin/standalone -c standalone.xml -b 0.0.0.0 (or start it from within the IDE, in the "Services" tab under "Servers")
* run 'java -jar j-lawyer-client.jar' in j-lawyer-org/j-lawyer-client/dist to run the client (or start it from within the IDE, by right-clicking "j-lawyer-client" projekt and choosing "Run")

**Questions: reach out to info (-at-) j-lawyer.org - we will provide support to anyone considering to support the project. Word!** 

### Hints

n/a
