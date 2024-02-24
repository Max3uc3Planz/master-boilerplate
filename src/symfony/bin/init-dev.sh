#!/bin/sh
# Execute composer and doctrine
composer dump-autoload
composer run-script post-install-cmd
php /var/www/html/src/bin/console cache:clear --no-debug

MYSQL_NEEDED=${HAS_MYSQL_DATABASE:-0}

if [ $MYSQL_NEEDED = 1 ] ; then
    php /var/www/html/src/bin/console doctrine:database:create --if-not-exists
    php /var/www/html/src/bin/console doctrine:database:create --connection=shared_store --if-not-exists
    php /var/www/html/src/bin/console doctrine:migrations:migrate --allow-no-migration
fi

chown -R application var