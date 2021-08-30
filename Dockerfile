# syntax=docker/dockerfile:1

# Use PHP as starting place
FROM php:7.0.33

# Install Node@6
# https://stackoverflow.com/a/39081818/59160
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
	&& apt-get install -y nodejs

# Install Python@3 and deps. I found I had to break up the pip installs into
# multiple stages to get the deps to resolve properly. All those apt-get deps
# mostly come from the requirements of the Cryptography package:
# https://cryptography.io/en/latest/installation/#debian-ubuntu
RUN apt-get update -y
RUN apt-get install -y python3-pip build-essential libssl-dev libffi-dev \
	python3-dev cargo
RUN pip3 install cffi
RUN pip3 install ansible pyrax paramiko
