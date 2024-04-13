FROM php:7.2-apache

WORKDIR /cacti

RUN apt update && apt install -y wget && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN wget https://files.cacti.net/cacti/linux/cacti-1.2.26.tar.gz
RUN tar -xvf cacti-1.2.26.tar.gz

RUN rm -rfv /var/www/html/*
RUN mv cacti-1.2.26/* /var/www/html

RUN rm -rfv /cacti
WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD [ "apache2-foreground" ]