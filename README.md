# Purpose
The primary goal of this project is to automate the provisioning of Amazon EC2 instances using Terraform. The specified configurations include:
- access_key
- secret_key
- ami
- key_name
- vpc_security_group_ids
- subnet_id
- Instance_Name
## Flexibility and Customization
The use of variables in the Terraform configurations allows for easy customization and adaptation to different AWS environments and use cases

## Jenkins Integration 
The configuration references a Bash script for installing Jenkins automatically upon EC2 creation

## Dynamic IP Retrieval
After successfully creating the EC2 instance, Terraform returns the public IP, making it accessible for further configuration or management
