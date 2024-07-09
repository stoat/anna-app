FROM php:8.3-fpm
RUN apt-get update && apt-get install -y \
	libzip-dev zip \
	libpng-dev \
	zip \
	&& docker-php-ext-configure zip \
	&& docker-php-ext-install zip \
	&& docker-php-ext-configure gd \
	&& docker-php-ext-install gd \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd
RUN docker-php-ext-enable mysqli
