#! /bin/bash

<<COMMENT
This Bash / Shell Script was developed from the install guide for debian (https://docs.docker.com/engine/install/debian/)
and adapted for Raspberry Pi 4 arm64 architecture. If you are trying to use this to install on CentOS, Fedora, RHEL, SLES or Ubuntu
if may not work as some of the commands are different. If that is the case just refer to the link provided and adapt it to your need.
COMMENT

#echo lines are used for troubleshooting purposes, so you know where the script completed too or not.
echo Welcome to the Docker-CE Install Script for Raspberry Pi

<<COMMENT
Un-comment the below sudo command if you have already installed Docker and want a fresh install and 
it’s OK if apt-get reports that none of these packages are installed.
COMMENT

#sudo apt-get remove docker docker-engine docker.io containerd runc

echo Installing required packages.
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
echo Required packages installed.

echo Adding Docker’s official GPG key.
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo Docker’s official GPG key installed.

echo Setting up the repository to use the stable branch
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo Stable branch set.

echo Installing the latest version of Docker Engine, containerd, and Docker Compose.
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo Completed installing the latest version of Docker Engine, containerd, and Docker Compose.

echo Completing some post-install configuration
sudo groupadd docker
# Adds the current logged in user to docker group
sudo usermod -aG docker $USER
sudo systemctl enable docker
echo Completed post-install configuration. 

echo Enjoy Docker-CE!
