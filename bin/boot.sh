#!/bin/bash

echo "Release script"
export

echo "====================="
find .
echo "====================="
pwd

erb httpd.conf >./apache/conf/httpd.conf
#cat ./apache/conf/httpd.conf

#file ./apache/bin/httpd
#ldd ./apache/bin/httpd

uname -a

tail -f apache/logs/error_log &

/app/apache/bin/httpd -k start

sleep 5
ps -ef | grep httpd

exit 1
