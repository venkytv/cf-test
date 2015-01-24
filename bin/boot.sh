#!/bin/bash

erb httpd.conf.tmpl >./apache/conf/httpd.conf

echo "=== APACHE ==="
/app/apache/bin/httpd -k start

echo "=== TOMCAT ==="
export CATALINA_HOME=/app/tomcat
export JRE_HOME=/app/jdk/jre
${CATALINA_HOME}/bin/startup.sh &

sleep 5
tail -f apache/logs/error_log &

while pgrep -f /app/apache/bin/httpd >/dev/null; do
	echo "Apache running..."
	sleep 60
done

exit 1
