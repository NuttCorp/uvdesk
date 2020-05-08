#!/bin/bash

sed -i 's/db_user/'$MYSQL_USER'/g' /var/www/uvdesk/.env
sed -i 's/db_password/'$MYSQL_PASSWORD'/g' /var/www/uvdesk/.env
sed -i 's/127.0.0.1/'$MYSQL_HOST'/g' /var/www/uvdesk/.env
sed -i 's/db_name/'$MYSQL_DATABASE'/g' /var/www/uvdesk/.env
  
service apache2 start

exec "$@"
