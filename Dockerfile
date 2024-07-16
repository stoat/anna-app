FROM php:8.3-fpm
RUN apt-get update && apt-get install -y \
	libpng-dev \
	libzip-dev zip \
	zip \
	libgd-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libjpeg-dev \
	 jpegoptim libwebp-dev optipng pngquant gifsicle \
	&& docker-php-ext-configure zip \
	&& docker-php-ext-install zip \
#	&& docker-php-ext-configure gd --with-jpeg --with-freetype \
	&& docker-php-ext-configure gd \
          --with-freetype=/usr/include/ \
          --with-jpeg=/usr/lib/x86_64-linux-gnu \
          --with-webp=/usr/lib/x86_64-linux-gnu  \
	&& docker-php-ext-install gd \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd
RUN docker-php-ext-enable mysqli