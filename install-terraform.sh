#!/bin/bash
# Terraform Installer for Debian based Linux Distributions
# Supported Debian and Ubuntu Releases: https://www.terraform.io/docs/cli/install/apt.html#supported-debian-and-ubuntu-releases

# Install curl
apt install curl -y

# Add HashiCorp GPG Key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add HashiCorp APT Repository
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install Terraform
apt install terraform
