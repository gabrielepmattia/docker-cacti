FROM php:7.2-apache

WORKDIR /cacti

RUN apt update && apt install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget https://files.cacti.net/cacti/linux/cacti-1.2.26.tar.gz
RUN tar -xvf cacti-1.2.26.tar.gz

RUN rm -rfv /var/www/html/*
RUN mv cacti-1.2.26/* /var/www/html

EXPOSE 80

CMD [ "apache2-foreground" ]