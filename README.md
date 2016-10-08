# Docker-Drupal

## Setup
Beta. To run you need to run `composer install` and `docker-compose up`. Look at the docker-compose.yml file and make sure your host file has the correct entires in it. There's a make file with some useful commands.


## TODO

* Figure out a better way to set up host file.
* Seperate composer commands and drush from docker-php and move it to a "terminal" command.
* Add scripts to set up drupal site quickly and to run drush/drupal console.

## Ports

### Nginx

* Nginx - 80 (Default)

### MySQL
* Mariadb - 2206 (Exposed, Default)

### Mailhog
* Mailhog HTTP - 8025 (Exposed, Default)
* Mailhog SMTP - 1025 (Default)

### Redis
* Redis - 6379 (Exposed, Default)

### PHP
* php-fpm - 9500 (Default)
* xdebug - 9000 (Default)
