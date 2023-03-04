#!/bin/bash
# IAC - Script configuration of a clusterized web service with docker Swarm - Manager node
# Prerequisites: 3 Vms Ubuntu with Docker Engine installed and stand-alone-service.sh Script already executed in the first VM.

echo -e "###\nStarting and configuring NFS Server\n###"
apt-get install nfs-server -y
echo "/var/lib/docker/volumes/app/_data *(rw,sync,subtree_check)" | tee -a /etc/exports
exportfs -ar

echo -e "###\nCreating Proxy Nginx Container\n###"
cd /var/lib/docker/volumes/app/_data
docker build -t proxy-app .
docker run --name my-proxy-app -dti -p 4500:4500 proxy-app

echo -e "###\nClosing web-server container before starting Docker Swarm\n###"
docker rm --force web-server

echo -e "###\nStarting Cluster Docker Swarm\n###"
docker swarm init
echo -e "###\nRun the suggested command above on all cluster machines before continuing\n###"
echo "Enter any key to continue:"
read ANY

# This command should be performed only after including all the machines in the cluster
echo -e "###\nCreating 10 Replicas of the Apache Conteiner with PHP 7\n###"
docker service create --name web-server --replicas 10 -dt -p 80:80 --mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7