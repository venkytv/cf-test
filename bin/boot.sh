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

uname -a

sleep 1
exit 1
