#!/usr/bin/env bash
# Default Values for terminus
TERMINUS_SITE=${TERMINUS_SITE:-darksupply-7}
TERMINUS_ENV=${TERMINUS_ENV:-dev}

# Test Values for Now
MYSQL_CONTAINER=mysql
MYSQL_DATABASE=project
MYSQL_USER=root
MYSQL_PASSWORD=project

# MySQL Dump Command
mysqldump=$(terminus site connection-info --site=$TERMINUS_SITE --env=$TERMINUS_ENV --field=mysql_command | \
   sed 's/^mysql/mysqldump --hex-blob --routines --triggers /')

# MySQL Container ID
dbps=$(docker-compose ps -q $MYSQL_CONTAINER | cut -f1)

terminus site wake --site=$TERMINUS_SITE --env=$TERMINUS_ENV
command time docker run -i --rm --net=container:$dbps derimagia/terminus "$mysqldump | mysql -u$MYSQL_USER -h$MYSQL_CONTAINER $MYSQL_DATABASE"

dburl=$(terminus site connection-info --site=$TERMINUS_SITE --env=$TERMINUS_ENV --field=mysql_url)
#command time docker run -i --rm --net=container:$dbps derimagia/terminus "$mysqldump > /dev/null"
command time terminus drush "sql-dump --gzip --db-url=$dburl" >  /dev/null
command time terminus drush "sql-dump --gzip --structure-tables-list=cache,cache_* --db-url=$dburl" >  /dev/null
command time terminus drush "sql-dump --db-url=$dburl" >  /dev/null
command time terminus drush "sql-dump --structure-tables-list=cache,cache_*  --db-url=$dburl" > /dev/null
