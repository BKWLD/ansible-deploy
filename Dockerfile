# syntax=docker/dockerfile:1

# Use PHP as starting place
FROM php:7.0.33

# Fix an UnicodeEncodeError
# https://github.com/pypa/pip/issues/10219#issuecomment-887337037
# ENV LANG C.UTF-8
# ENV LC_ALL C.UTF-8

# Update linux deps
RUN apt-get update -y

# Add more PHP extensions
# https://stackoverflow.com/a/48700777/59160
RUN apt-get update && apt-get install -y libzip-dev zip \
	&& docker-php-ext-configure zip --with-libzip \
	&& docker-php-ext-install zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node@6
# https://stackoverflow.com/a/39081818/59160
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
	&& apt-get install -y nodejs

# Install Yarn
RUN npm install -g yarn

# Install Python@3 and deps. I found I had to break up the pip installs into
# multiple stages to get the deps to resolve properly. All those apt-get deps
# mostly come from the requirements of the Cryptography package:
# https://cryptography.io/en/latest/installation/#debian-ubuntu
RUN apt-get install -y build-essential libssl-dev libffi-dev \
	python python-pip cargo
RUN pip install cffi pbr wrapt==1.12.1
RUN pip install ansible pyrax paramiko

# Install additional apps
RUN apt-get install -y rsync
