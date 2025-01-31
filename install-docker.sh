#!/bin/bash

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

if ! docker version &> /dev/null && ! docker compose version &> /dev/null; then
  sudo apt-get install -y ca-certificates curl zip
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo chmod 777 /var/run/docker.sock
  sudo usermod -aG docker $USER
fi

docker compose up -d

if [ ! -e "./wordpress_data/wp-content/plugins/all-in-one-wp-migration/" ]; then
  sudo apt update
  sudo apt install zip
  wget https://downloads.wordpress.org/plugin/all-in-one-wp-migration.7.88.zip
  unzip all-in-one-wp-migration.7.88.zip
  sudo rm all-in-one-wp-migration.7.88.zip
  sudo chmod 777 all-in-one-wp-migration
  sudo mv all-in-one-wp-migration ./wordpress_data/wp-content/plugins/
fi