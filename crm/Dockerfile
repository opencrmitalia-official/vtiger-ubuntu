FROM os:22.04

ENV COMPOSER_HOME=/usr/src/vtiger \
    PATH="/usr/src/vtiger/vendor/bin:$PATH"

RUN curl -o composer -sL https://github.com/composer/composer/releases/download/2.2.21/composer.phar

RUN php composer global require javanile/mysql-import:0.0.16

RUN apt install cron

COPY docker-vtiger-download.sh /usr/local/bin/
RUN bash /usr/local/bin/docker-vtiger-download.sh

COPY docker-vtiger-foreground.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-vtiger-foreground.sh

RUN mkdir -p /usr/src/vtiger && touch /usr/src/vtiger/vtiger.sql

COPY loader.php /usr/src/vtiger/

COPY vtiger.json /usr/src/vtiger/

ENV MYSQL_DATABASE="vtiger"

CMD ["/usr/local/bin/docker-vtiger-foreground.sh"]