# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rofernan <rofernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/19 13:40:55 by rofernan          #+#    #+#              #
#    Updated: 2020/02/03 15:50:10 by rofernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster
LABEL	maintainer="Rofernan (rofernan@42.fr)"

RUN		apt-get update -yq \
		&& apt-get upgrade -yq \
		&& apt-get install wget -yq \
		&& apt-get install nginx -yq \
		&& apt-get install mariadb-server -yq \
		&& apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring -yq

COPY	./srcs/* /var/

WORKDIR	/var/www/html

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin \
		&& chmod 755 -R /var/www/html/phpmyadmin

RUN		wget https://wordpress.org/latest.tar.gz \
		&& tar xf latest.tar.gz \
		&& rm -rf latest.tar.gz \
		&& chmod 755 -R /var/www/html/wordpress

RUN		mv /var/localhost /etc/nginx/sites-available/localhost \
		&& ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost \
		&& rm /etc/nginx/sites-enabled/default

RUN		mv /var/wp-config.php /var/www/html/wordpress

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=rofernan' -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

CMD		bash /var/command.sh

EXPOSE	80 443