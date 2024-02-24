FROM webdevops/php-nginx-dev:8.2

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN rm /usr/local/etc/php/conf.d/99-blackfire.ini

RUN apt-get update && apt-get install libz-dev -y

COPY  ./conf/nginx/ /opt/docker/etc/nginx/

RUN rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

WORKDIR /var/www/html/src

COPY  ./composer.json ./composer.lock ./
RUN composer install -n -o --no-scripts

COPY . .

ADD ./bin/envs.sh /bin/envs.sh
RUN chmod +x /bin/envs.sh
ADD ./bin/init-dev.sh /bin/init-dev.sh
RUN chmod +x /bin/init-dev.sh
CMD /bin/envs.sh && /bin/init-dev.sh && supervisord