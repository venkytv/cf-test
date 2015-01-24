#!/bin/bash

echo "Release script"
export

echo "====================="
find .
echo "====================="
pwd

erb httpd.conf >./apache/conf/httpd.conf
cat ./apache/conf/httpd.conf

ldd ./apache/bin/httpd

sleep 1
exit 1
