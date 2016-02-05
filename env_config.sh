#!/bin/bash

sed -i 's/DocumentRoot "\/var\/www\/html"/DocumentRoot "$HTTPD_ROOT"/g' /etc/httpd/conf/httpd.conf
sed -i 's/<Directory "\/var\/www">/<Directory "$HTTPD_BASE">/g' /etc/httpd/conf/httpd.conf
sed -i 's/appBase="webapps"/appBase="$TOMCAT_BASE"/g' /usr/local/tomcat/conf/server.xml

mkdir -p $HTTPD_BASE
mkdir -p $HTTPD_ROOT
mkdir -p $TOMCAT_BASE
ln -sf $HTTPD_BASE $HTTPD_LINK
