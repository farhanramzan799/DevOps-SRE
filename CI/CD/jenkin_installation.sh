#!/bin/bash


# Installing jenkins locally on ubuntu:

# Install java using following command:
	
sudo apt update
sudo apt install openjdk-8-jdk
# Import the GPG keys of the Jenkins repository using the following wget command:
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key

# Next, add the Jenkins repository to the system with:

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins.

# Once the Jenkins repository is enabled, update the apt package list and install the latest version of Jenkins by typing:

sudo apt update
sudo apt install jenkins

#Verify:

systemctl status jenkins


sudo cat /var/lib/jenkins/secrets/initialAdminPassword
