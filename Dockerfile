FROM eviles/alpine-tomcat8

RUN apk --update add apache2 apache2-utils apache2-proxy \
&& rm -rf /var/cache/apk/* \
&& sed -i '/^#ServerName/cServerName localhost' /etc/apache2/httpd.conf \
&& sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.htm index.jsp/g' /etc/apache2/httpd.conf \
&& echo "[program:httpd]" >> /etc/supervisord.conf \
&& echo "command=/usr/sbin/httpd -D FOREGROUND" >> /etc/supervisord.conf \
&& mkdir /run/apache2 \
&& addgroup apache \
&& echo "ProxyPassMatch ^/(.*\.do)\$ ajp://localhost:8009/\$1" >> /etc/apache2/httpd.conf \
&& echo "ProxyPassMatch ^/(.*\.jsp)\$ ajp://localhost:8009/\$1" >> /etc/apache2/httpd.conf \
&& echo "ProxyPassReverse  /  ajp://localhost:8009/" >> /etc/apache2/httpd.conf

EXPOSE 80
VOLUME /var/www/localhost/htdocs
