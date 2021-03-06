#!/bin/bash -e
cd /usr/local/tomcat/webapps/ROOT
PG_LIB=`find WEB-INF/lib -name "postgresql-*"`
if java ${CATALINA_OPTS} -cp WEB-INF/classes/:$PG_LIB org.mapfish.print.WaitDB
then
    cp WEB-INF/classes/mapfish-spring-application-context-override-db.xml \
       WEB-INF/classes/mapfish-spring-application-context-override.xml
fi

mkdir -p print-apps
rm -f /usr/local/tomcat/temp/mapfish-print/ROOT/stop /usr/local/tomcat/temp/mapfish-print/ROOT/stopped
exec catalina.sh run
