FROM php:8.1-fpm

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    supervisor

RUN mkdir -p "/etc/supervisor/logs"

COPY docker/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/supervisord.conf"]