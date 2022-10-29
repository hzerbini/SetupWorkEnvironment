#!/bin/bash

sudo apt install -y snapd
sudo apt update

# Install Docker
#1 - Package Dependencies
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#2 - GPG key
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#3 - Setup Repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#4 - Docker Install
sudo apt-get update

sudo apt-get install -y docker-ce \
    docker-ce-cli\
    containerd.io\
    docker-compose-plugin

#5 - Post instalation steps
sudo groupadd -f docker
sudo usermod -aG docker ${SUDO_USER:-$USER}

#6 - Enable docker to start on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

#Install GIT

sudo apt-get install -y git

#Install Keepassxc
sudo apt install -y keepassxc

#Install Flameshot
apt install flameshot

#Install Clickup
curl --output Clickup.AppImage https://desktop.clickup.com/linux
chmod +x Clickup.AppImage
chown ${SUDO_USER:-$USER} Clickup.AppImage

#Install Postman
sudo snap install postman

#Install Discord
sudo snap install discord
sudo snap connect discord:system-observe

#Install Beekeper
sudo snap install beekeeper-studio

# Install Oh My Zshi
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i "s/plugins=(git)/plugins=(git laravel node docker)/g" ~/.zshrc 
chsh -s /usr/bin/zsh
reboot
