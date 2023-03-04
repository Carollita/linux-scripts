#!/bin/bash
# IAC - Configuration Script of a clusterized web service with Docker Swarm - Workers Nodes
# Run this script after running the Swarm Join docker

echo -e "###\nConfiguring NFS clients\n###"
apt-get install nfs-common -y
mount -o v3 192.168.0.11:/var/lib/docker/volumes/app/_data /var/lib/docker/volumes/app/_data