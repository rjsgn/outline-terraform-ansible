# Outline Terraform Ansible

Automated deployment of [Outline](https://github.com/outline/outline), a modern knowledge base, using Terraform and Ansible.

The script currently automates deployment of Outline server on Google Cloud Platform. This script will :

- Create a virtual machine
- Add the SSH public key specified in the variables to authorized keys in the virtual machine
- Create a VPC network
- Create Postgres database instance that's accessible only in the VPC network
- Create database and user
- Add firewall rules to open ports 22, 80 and 443 *(TCP and ICMP Protocols)*
- Install Outline server and it's dependencies
- Deploy the application using PM2

## Prerequisites

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

- [Terraform Provisioner Ansible](https://github.com/radekg/terraform-provisioner-ansible)

## How to use

Before running the script, make sure you update values in the file `vars.tf`. 

    Note:

    The script by default creates cloud resources that are not covered by GCP Free Tier.
    
    Please calculate the cost of the resources that you mention in the variables *vars.tf* file.
    
**I do not claim responsibility for any cost incurred from running this script.**

### Steps:

- Clone this repository
- Make sure Terraform Provisioner Ansible is installed
- Update the values of the variables in the files `gcp/vars.tf` and `ansible/group_vars/all`
- Change directory to `gcp`
- Run `terraform init`
- Run `terraform apply`
- Sit back and relax

## Destroying resources

To destroy all the resources the script created, run `terraform destroy`.

**Caution: This will destroy all resources created using this terraform script. Any data stored on the virtual machine or the database will be permanently deleted.**
