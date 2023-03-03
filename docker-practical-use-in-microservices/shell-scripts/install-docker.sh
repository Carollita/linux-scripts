#!/bin/bash
# https://docs.docker.com/engine/install/ubuntu/

echo -e "###\nInstall Docker on Ubuntu\n###"

echo -e "###\nInstalling packages to allow apt to use a repository over HTTPS\n###"
apt-get update
apt-get install ca-certificates curl gnupg lsb-release -y


echo -e "###\nAdd Docker’s official GPG key\n###"
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg


echo -e "###\nSet up the repository\n###"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null


echo -e "###\nInstall Docker Engine, containerd, and Docker Compose.\n###"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y