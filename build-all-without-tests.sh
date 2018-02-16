#! /bin/sh 

ant -buildfile ../j-lawyer-drebis-stubs/build.xml jar
ant -buildfile ../j-lawyer-fax/build.xml jar
ant -buildfile ../j-lawyer-bea-wrapper/build.xml jar
ant -buildfile ../j-lawyer-server-api/build.xml jar
ant -buildfile ../j-lawyer-server-common/build.xml jar
ant -buildfile ../j-lawyer-server-entities/build.xml dist
ant -buildfile ../j-lawyer-server/build.xml dist
ant -buildfile ../j-lawyer-client/build.xml jar
