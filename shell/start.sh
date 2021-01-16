
mkdir -p \
/config{/log/nginx,/log/mysql,/log/php} \
/config/nginx/{sites-enabled,modules-enabled,conf.d} \
/config/mysql/{conf.d,mariadb.conf.d} \
/config/php/fpm/pool.d \
/config/memcached

[[ ! -e /config/nginx/nginx.conf ]] && \
	cp /defaults/nginx/nginx.conf /config/nginx/nginx.conf

[[ ! -e /config/nginx/sites-enabled/default ]] && \
	cp /defaults/nginx/default /config/nginx/sites-enabled/default
cp -pr /config/nginx/* /etc/nginx/


[[ ! -e /config/mysql/mariadb.conf.d/50-server.cnf ]] && \
	cp /defaults/mysql/50-server.cnf /config/mysql/mariadb.conf.d/50-server.cnf
cp -pr /config/mysql/*  /etc/mysql/


[[ ! -e /config/php/fpm/php.ini ]] && \
	cp /defaults/php/fpm/php.ini /config/php/fpm/php.ini
[[ ! -e /config/php/fpm/php-fpm.conf ]] && \
	cp /defaults/php/fpm/php-fpm.conf /config/php/fpm/php-fpm.conf
[[ ! -e /config/php/fpm/pool.d/www.conf ]] && \
	cp /defaults/php/fpm/pool.d/www.conf /config/php/fpm/pool.d/www.conf

cp -pr /config/php/*  /etc/php/5.6/

[[ ! -e /config/memcached/memcached.conf ]] && \
	cp /defaults/memcached/memcached.conf /config/memcached/memcached.conf

cp -pr /config/memcached/memcached.conf /etc/memcached.conf

[[ "`ls -A /NexusPHP`" = "" ]] && \
    cp -r /defaults/nexusphp.v1.5.beta5.20120707/* /NexusPHP/

service nginx start 
service memcached start 
service mysql start 
service php5.6-fpm start 
