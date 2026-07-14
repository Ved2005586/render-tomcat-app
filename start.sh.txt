#!/bin/sh
# Render sets $PORT at runtime. Tomcat defaults to 8080, so we patch
# server.xml to listen on Render's port instead before starting.

PORT="${PORT:-8080}"

sed -i "s/port=\"8080\"/port=\"${PORT}\"/" /usr/local/tomcat/conf/server.xml

exec /usr/local/tomcat/bin/catalina.sh run