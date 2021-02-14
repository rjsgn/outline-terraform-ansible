#!/bin/bash
# Ansible Installer for Debian based Linux Distributions
# Refer: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu

# Install curl
apt update

# Install requirements
apt install software-properties-common

# Add Ansible APT Repository
apt-add-repository --yes --update ppa:ansible/ansible

# Install Terraform
apt install ansible
