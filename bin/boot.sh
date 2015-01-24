#!/bin/bash

echo "Release script"
export

echo "====================="
find .
echo "====================="
pwd

erb httpd.conf >./apache/conf/httpd.conf
cat ./apache/conf/httpd.conf

file ./apache/bin/httpd
ldd ./apache/bin/httpd
ls -il ./apache/bin/httpd

uname -a

ls -il /app
ls -il /app/apache
ls -il /app/apache/bin/https

sleep 1
exit 1
