FROM debian:buster

#On installe tous les packages dont on a besoin
RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	&& rm -rf /var/lib/apt/lists/*

# On installe la version ligne de commande de wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# On prend notre fichier conf et on le met dans le container
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# On creer le fichier qui permettra de run php
RUN mkdir /run/php

# On installe wordpress grace au sh que l'on a cree au prealable
COPY ./tools/install_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install_wordpress.sh
ENTRYPOINT ["/usr/local/bin/install_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
