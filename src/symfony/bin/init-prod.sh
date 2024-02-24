#!/bin/sh
# Execute composer and doctrine
php /var/www/html/src/bin/console cache:clear --no-debug --quiet
php /var/www/html/src/bin/console enqueue:setup-broker --quiet

MYSQL_NEEDED=${HAS_MYSQL_DATABASE:-0}

if [ $MYSQL_NEEDED = 1 ] ; then
    php /var/www/html/src/bin/console doctrine:database:create --if-not-exists --quiet
    php /var/www/html/src/bin/console doctrine:database:create --connection=shared_store --if-not-exists --quiet
    php /var/www/html/src/bin/console doctrine:migrations:migrate --allow-no-migration --quiet
fi

chown -R application var