#!/usr/bin/env bash
PROJECT_NAME=dockerdrupal
NETWORK_NAME=${PROJECT_NAME}_default
MYSQL_HOSTNAME=${PROJECT_NAME}_mysql_1
MYSQL_DATABASE=project
MYSQL_USER=project
MYSQL_PASSWORD=project
SITE=darksupply-7
ENV=dev

mysqldump=$(terminus site connection-info --site=$SITE --env=$ENV --field=mysql_command | \
   sed 's/^mysql/mysqldump --hex-blob --routines --triggers /')

dbps=$(docker-compose ps -q mysql)

terminus site wake --site=$SITE --env=$ENV

docker exec -i "$dbps" sh -c "$mysqldump | mysql -uroot project"

# Try to do it through terminus CLI: (Need to connect terminus + mysql, maybe install mysql on cli container)

# mysqldump="$(terminus site connection-info --site=$SITE --env=dev --field=mysql_command | \
#    sed 's/^mysql/mysqldump --hex-blob --routines --triggers /') | \
#    mysql -uproject -pproject -hmysql project"
#
# mysqlps=$(docker-compose ps -q mysql)
#
# # Wake Site
# terminus site wake --site=$SITE --env=dev
# docker run --rm -i derimagia/terminus "$mysqldump"
