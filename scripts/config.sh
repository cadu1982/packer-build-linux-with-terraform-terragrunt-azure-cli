#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
echo "Dependencies Install"
sudo apt-get install curl -y
sudo apt-get install openssh-client -y
sudo apt-get install wget
sudo apt-get install lsb-release -y
sudo apt-get install gnupg -y
sudo apt-get install ca-certificates
sudo apt-get install apt-transport-https
sudo apt-get install build-essential procps file -y
sudo apt-get update
sudo apt-get install git -y
echo "HomeBrew Install"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "Terragrunt Install"
brew install terragrunt
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update 
echo "Terraform Install"
sudo apt-get install terraform
echo "Azure CLI Install"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
echo "Docker Install"
sudo apt install -y software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
echo "Kubectl Install"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl