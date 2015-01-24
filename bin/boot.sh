#!/bin/bash

echo "Release script"
export

erb httpd.conf >./apache/conf/httpd.conf

echo "==== JAVA ===="
add-apt-repository "deb http://archive.canonical.com/ lucid  partner"
apt-get update
apt-get install sun-java6-jre
type java

/app/apache/bin/httpd -k start
sleep 5

tail -f apache/logs/error_log &

while pgrep -f /app/apache/bin/httpd >/dev/null; do
	echo "Apache still running"
	sleep 30
done

exit 1
