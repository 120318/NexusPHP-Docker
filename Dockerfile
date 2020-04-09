FROM ubuntu:18.04

ARG PHPMYADMIN=4.8.5

RUN apt-get update;

RUN apt-get install -y wget tar vim unzip curl git nginx cron \
software-properties-common apt-transport-https

RUN add-apt-repository -y ppa:ondrej/php; \
export DEBIAN_FRONTEND=noninteractive; \
apt-get install -yq php5.6 php5.6-cli \ 
php5.6-common php5.6-curl php5.6-fpm php5.6-json \
php5.6-mysql php5.6-opcache php5.6-readline \
php5.6-xml php5.6-xsl php5.6-gd php5.6-intl \
php5.6-bz2 php5.6-bcmath php5.6-imap php5.6-gd \
php5.6-mbstring php5.6-pgsql php5.6-sqlite3 \
php5.6-xmlrpc php5.6-zip php5.6-odbc php5.6-snmp \
php5.6-interbase php5.6-ldap php5.6-tidy php5.6-memcache \
php5.6-memcached php-tcpdf php-redis php-imagick php-mongodb;

RUN apt-get install -yq mariadb-server mariadb-client; \
cd / && ( \
  wget -q https://files.phpmyadmin.net/phpMyAdmin/$PHPMYADMIN/phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
  unzip -oq phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
  mv phpMyAdmin-$PHPMYADMIN-all-languages pma; \
  rm -f phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
)

RUN apt-get install -y memcached;


RUN wget -q http://pear.php.net/go-pear.phar;\
php go-pear.phar;\
pear install HTTP_Request2-2.3.0

COPY nginx/default /etc/nginx/sites-enabled/default
COPY mysql/add_user.sql /tmp/add_user.sql
COPY phpmyadmin/config.inc.php /pma/config.inc.php
COPY php/php.ini  /etc/php/5.6/fpm/

RUN service mysql start && mysql < /tmp/add_user.sql

CMD service nginx start && service memcached start \
&& service mysql start  && service php5.6-fpm start \
&& tail -f /dev/null;
