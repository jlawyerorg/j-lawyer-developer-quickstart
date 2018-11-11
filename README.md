# j-lawyer.org Developer Quickstart

Repository with documentation, scripts and tools for building all sub projects. No source code in this repository that will end up in any release.

## Quickstart: 

### Prepare environment

* install MySQL Community Server
* install "ant" - either download from the apache.org directly, or - on Linux with apt - type 'sudo apt-get install ant'
* download and unpack http://www.j-lawyer.org/downloads/j-lawyer-developer-quickstart/wildfly.tar.gz
* edit "standalone-full.xml" in wildfly-9.0.2.Final/standalone/configuration and update the MySQL root password

### Build the application

* Clone repository j-lawyer-org to your local disk
* run build-fast.sh in repository j-lawyer-org to build the applications, skipping tests

### Set up a new development database

* run j-lawyer-org/j-lawyer-server/setup/create_database.sql in a MySQL prompt or frontend
This will create an empty j-lawyer.org database with users admin/a and user/u

### Deploy the server

* take j-lawyer-server.ear from j-lawyer-org/j-lawyer-server/dist/ and put it in wildfly-9.0.2.Final/standalone/deployments - this will install the server binaries
* run 'java -jar j-lawyer-client.jar' in j-lawyer-org/j-lawyer-client/dist to run the client

**Questions: reach out to info (-at-) j-lawyer.org - we will provide support to anyone considering to support the project. Word!** 
