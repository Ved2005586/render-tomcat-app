#!/bin/sh
# Render sets $PORT at runtime. Tomcat defaults to 8080, so we patch
# server.xml to listen on Render's port instead before starting.

PORT="${PORT:-8080}"

sed -i "s/port=\"8080\"/port=\"${PORT}\"/" /usr/local/tomcat/conf/server.xml

# Disable the shutdown port so Render's health check pings don't spam
# the logs with "Invalid shutdown command" warnings.
sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/' /usr/local/tomcat/conf/server.xml

exec /usr/local/tomcat/bin/catalina.sh run