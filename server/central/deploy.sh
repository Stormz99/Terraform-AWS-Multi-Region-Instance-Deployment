#!/bin/bash

# Update package lists
sudo apt update

# Install Ansible
sudo apt install -y ansible

# Install Docker dependencies
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package lists with Docker repository
sudo apt update

# Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add user to the docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Display Docker version
docker --version

# Display Ansible version
ansible --version

echo "Ansible and Docker have been installed."