#!/bin/bash

erb templates/httpd.conf.tmpl >./apache/conf/httpd.conf

echo "=== APACHE ==="
/app/apache/bin/httpd -k start

echo "=== TOMCAT ==="
export CATALINA_HOME=/app/tomcat
export JRE_HOME=/app/jre
${CATALINA_HOME}/bin/startup.sh &

sleep 2
tail -f apache/logs/error_log &
tail -f tomcat/logs/catalina.out &

# Deploy all war files
WEBAPPDIR=/app/tomcat/webapps
for WAR in *.war; do
	[ -r "$WAR" ] || continue
	echo "Deploying $WAR"
	cp "$WAR" "$WEBAPPDIR"
done

while pgrep -f /app/apache/bin/httpd >/dev/null; do
	echo "Apache running..."
	sleep 60
done

exit 1
