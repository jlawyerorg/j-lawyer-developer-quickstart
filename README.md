# j-lawyer.org Developer Quickstart

Repository with documentation, scripts and tools for building all sub projects. No source code in this repository that will end up in any release.

## Quickstart: 
 
### Prepare environment

* Windows: download required tools from http://www.j-lawyer.org/downloads/j-lawyer-developer-quickstart/tools.zip and extract it
* Linux: install Java 17 JDK (suggest to use Liberica JDK 17: https://bell-sw.com/pages/downloads/#/java-17-lts)
* Linux/Windows: install Netbeans IDE (https://netbeans.apache.org/) - the repositories have project definitions for this IDE, and the j-lawyer.org client is largely built using Netbeans' GUI builder. Windows: launch the installer in a command prompt and specify the JDK location from the tools you downloaded - e.g. Apache-Netbeans-22-bin-windows-x64.exe --javahome C:\dev\tools\jdk-17.0.11-full
* install MariaDB (Windows: https://mariadb.org/download/?t=mariadb&p=mariadb&r=10.6.18&os=windows&cpu=x86_64&pkg=msi&mirror=agdsn, Linux: through package management)
* Linux: install "ant" - either download from the apache.org directly, or - on Linux with apt - type 'sudo apt-get install ant'
* Linux/Windows: download and unpack http://www.j-lawyer.org/downloads/j-lawyer-developer-quickstart/wildfly.tar.gz
* edit "standalone.xml" in wildfly-26.1.3.Final/standalone/configuration and update the MySQL root password (search for jlawyerdbpwd in the file)
* edit "standalone.xml" in wildfly-26.1.3.Final/standalone/configuration and set data directories (search for "jlawyer.server.basedirectory" and "jlawyer.server.initdir" in the file)
* in Netbeans, configure Wildfly server so you can start / stop / debug it from within Netbeans (http://www.mastertheboss.com/eclipse/jboss-netbeans/configuring-netbeans-with-wildfly/). Use "standalone.xml" as server configuration, not "standalone-full.xml". 

### Build the application

* Clone repository j-lawyer-org to your local disk. When on Windows, the top most folder "j-lawyer-org" should reside next to the "tools" folder you downloaded and extracted. When cloning directly from within Netbeans ("Team" - "Remote" - "Clone"), Netbeans will automatically scan for projects and open them.
* Linux: run build-fast.sh in repository j-lawyer-org to build the applications, skipping tests (first take care of the jdk paths in the script, if necessary; same for deploy.sh)
* Example for using mariaDB on Linux: 
- install MariaDB server and client, e.g. with 'sudo apt-get install mariadb-server mariadb-client'
- start the server with 'sudo systemctl start mariadb'
- run 'mysql_secure_installation' to set the root password and secure the installation 
    (Enter current password for root (enter for none): Enter
    Switch to unix_socket authentication [Y/n]: n
    Set root password? [Y/n]: Y
    New password: yourPassword (as in standalone.xml)
    Re-enter new password: yourPassword (as in standalone.xml)
    Remove anonymous users? [Y/n]: Y
    Disallow root login remotely? [Y/n]: Y
    Remove test database and access to it? [Y/n]: Y
    Reload privilege tables now? [Y/n]: Y)"
* Windows: run build-windows.sh in Git Bash, followed by deploy-windows.sh (both located in folder "j-lawyer-org")

### Running tests

* In contrast to build-fast.sh, build.sh will also run the automated tests.

### Set up a new development database

Run j-lawyer-org/j-lawyer-server/setup/create_database.sql in a MySQL prompt or frontend. MariaDB on Windows ships with HeidiSQL as a frontend, or connect to the database using

    mysql -u root -p

then then issue the command (replace path to your script):

    source C:/dev/j-lawyer-org/j-lawyer-server/setup/create_database.sql;

(use forward slashes)
This will create an empty j-lawyer.org database with users admin/a and user/u

### Deploy the server

* once the build ran successfully, take j-lawyer-server.ear from j-lawyer-org/j-lawyer-server/dist/ and put it in wildfly-26.1.3.Final/standalone/deployments - this will install the server binaries. Scripts deploy.sh and deploy-windows.sh will take care of this.
* Linux / macOS: launch the server with: sh wildfly-26.1.3.Final/bin/standalone.sh -c standalone.xml -b 0.0.0.0 (or start it from within the IDE, in the "Services" tab under "Servers")
* Windows: launch the server with: wildfly-26.1.3.Final/bin/standalone -c standalone.xml -b 0.0.0.0 (or start it from within the IDE, in the "Services" tab under "Servers")
* run 'java -jar j-lawyer-client.jar' in j-lawyer-org/j-lawyer-client/dist to run the client (or start it from within the IDE, by right-clicking "j-lawyer-client" projekt and choosing "Run")

**Questions: reach out to info (-at-) j-lawyer.org - we will provide support to anyone considering to support the project. Word!** 

### Hints

n/a
