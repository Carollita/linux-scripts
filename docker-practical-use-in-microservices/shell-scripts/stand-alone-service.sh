#!/bin/bash
# IaC - Configuration script for a stand-alone web service.
# Prerequisite: Docker Engine installed.

echo -e "###\nCreate volumes\n###"
docker volume create app
docker volume create data

echo -e "###\nDownloading files\n###"
cd /var/lib/docker/volumes/app/_data
wget https://github.com/jpmjunior/dio-desafio-microservicos/archive/refs/heads/main.zip
apt-get install unzip -y
unzip main.zip
mv -v dio-desafio-microservicos-main/* .
rm -rv dio-desafio-microservicos-main main.zip

echo -e "###\nCreating MySQL Container\n###"
docker run -e MYSQL_ROOT_PASSWORD=pass123 -e MYSQL_DATABASE=mydata --name mysql-A -d -p 3306:3306 --mount type=volume,src=data,dst=/var/lib/mysql/ mysql:5.7

echo -e "###\nCreating Apache container with PHP 7\n###"
sudo docker run --name web-server -dt -p 80:80 --mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7

echo -e "###\nCreating a table using a command and storing it in a file\n###"
docker exec -i mysql-A sh -c 'exec mysql -u root -p"$MYSQL_ROOT_PASSWORD" mydata' < data.sql