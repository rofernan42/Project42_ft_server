service php7.3-fpm start
service nginx start
service mysql start

mysql < /var/create_db_wp.sql
mysql < /var/create_user.sql
/bin/sh