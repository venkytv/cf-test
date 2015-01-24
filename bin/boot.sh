#!/bin/bash

echo "Release script"
export

erb httpd.conf >./apache/conf/httpd.conf

echo "=== APACHE ==="
/app/apache/bin/httpd -k start

echo "=== TOMCAT ==="
export CATALINA_HOME=/app/tomcat
export JRE_HOME=/app/jdk/jre
${CATALINA_HOME}/bin/startup.sh &

sleep 5

tail -f apache/logs/error_log &

while pgrep -f /app/apache/bin/httpd >/dev/null; do
	echo "Apache still running"
	sleep 30
done

exit 1
