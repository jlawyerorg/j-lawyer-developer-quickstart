# j-lawyer.org Developer Quickstart

Repository with documentation, scripts and tools for building all sub projects. No source code in this repository that will end up in any release.

## Quickstart: 
 
### Prepare environment

* install MySQL Community Server
* install "ant" - either download from the apache.org directly, or - on Linux with apt - type 'sudo apt-get install ant'
* download and unpack http://www.j-lawyer.org/downloads/j-lawyer-developer-quickstart/wildfly.tar.gz
* edit "standalone-full.xml" in wildfly-16.0.0.Final/standalone/configuration and update the MySQL root password (search for jlawyerdbpwd in the file)

### Build the application

* Clone repository j-lawyer-org to your local disk
* run build-fast.sh in repository j-lawyer-org to build the applications, skipping tests

### Running tests

* In contrast to build-fast.sh, build.sh will also run the automated tests.

### Set up a new development database

* run j-lawyer-org/j-lawyer-server/setup/create_database.sql in a MySQL prompt or frontend
This will create an empty j-lawyer.org database with users admin/a and user/u

### Deploy the server

* take j-lawyer-server.ear from j-lawyer-org/j-lawyer-server/dist/ and put it in wildfly-16.0.0.Final/standalone/deployments - this will install the server binaries
* Linux / macOS: launch the server with: sh wildfly-16.0.0.Final/bin/standalone.sh -c standalone-full.xml -b 0.0.0.0
* Windows: launch the server with: wildfly-16.0.0.Final/bin/standalone -c standalone-full.xml -b 0.0.0.0
* run 'java -jar j-lawyer-client.jar' in j-lawyer-org/j-lawyer-client/dist to run the client

**Questions: reach out to info (-at-) j-lawyer.org - we will provide support to anyone considering to support the project. Word!** 

### Hints

#### Hibernate server timezone

If you get some Hibernate errors about provided server timezone like following
```
com.mysql.cj.exceptions.InvalidConnectionAttributeException: The server time zone value 'CEST' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the serverTimezone configuration property) to use a more specifc time zone value if you want to utilize time zone support. 
```
To solve this extend the JDBC connection string in ``wildfly-16.0.0.Final/standalone/standalone-full.xml`` with correct timezone. Search for ``jdbc:mysql`` and change line
```
<connection-url>jdbc:mysql://localhost:3306/jlawyerdb</connection-url>
```
to
```
<connection-url>jdbc:mysql://localhost:3306/jlawyerdb?serverTimezone=Europe/Berlin</connection-url>
```
Set correct timezone used by your MYSQL database server.
