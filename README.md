# Outline Terraform Ansible

Automated deployment of [Outline](https://github.com/outline/outline), a modern knowledge base, using Terraform and Ansible.

## Deploy to Google Cloud Platform

The script currently automates deployment of Outline server on Google Cloud Platform. This script will :

- Create a virtual machine
- Add the SSH public key specified in the variables to authorized keys in the virtual machine
- Create a VPC network
- Create Postgres database instance that's accessible only in the VPC network
- Create database and user
- Add firewall rules to open ports 22, 80 and 443 *(TCP and ICMP Protocols)*
- Install Outline server and it's dependencies
- Deploy the application using PM2
- Install Nginx and Certbot
- Create a reverse proxy to the application
- Get Let's Encrypt certificate for the domain mentioned in `ansible/group_vars/all` (Optional)

### Prerequisites

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Terraform Provisioner Ansible](https://github.com/radekg/terraform-provisioner-ansible)
- Google Cloud Platform Service Account Private Key with required permissions
- Domain Name (Optional)

### How to use

Before running the script, make sure you update values in the file `vars.tf`. Alternatively, you can use a `.tfvars` file.

    Note:

    The script by default creates cloud resources that are not covered by GCP Free Tier.
    
    Please calculate the cost of the resources that you mention in the variables *vars.tf* file.
    
**I do not claim responsibility for any cost incurred from running this script.**

### Steps:

- Clone this repository
- Make sure Terraform Provisioner Ansible is installed
- Create a service account with *Compute Admin* and *Service Networking Admin* roles
- Generate a key for the service account and update the path in variables
- Update the values of the variables in the files `gcp/vars.tf` and `ansible/group_vars/all`
- Change directory to `gcp`
- Run `terraform init`
- Run `terraform apply`
- Sit back and relax
- Update the domain's A record to point to the IP of the VM when prompted

### Destroying resources

To destroy all the resources the script created, run `terraform destroy`.

**Caution: This will destroy all resources created using this terraform script. Any data stored on the virtual machine or the database will be permanently deleted.**

## Deploy using Ansible

If you prefer deploying the application elsewhere, you could just use the Ansible Playbook.

You would have to create database manually and provide connection details as parameter extra-vars.

### Prerequisites

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Domain Name (Optional)

### How to use

- Update the values of the variables in group_vars/all
- Update ansible hosts file
- Run `ansible-playbook main.yml -i hosts --extra-vars='{"db_ip_address":"127.0.0.1","db_name":"outline_db","db_password":"Passw0rd","db_username":"outline_db_user"}'`
