# arc204-iac

### Getting Started

Prerequisites:
- AWS Account and IAM User with appropriate permissions
-- Create IAM user, save access key and secret, permissions -> attach Administrator or PowerUser role or custom policy
- Cloud9 account http://c9.io

Create cloud9 workspace:

    "Custom" template (ubuntu)
    Private
    Clone this repo ( https://github.com/bVector/arc204-iac )
  
Install Terraform - 

```
wget https://releases.hashicorp.com/terraform/0.6.8/terraform_0.6.8_linux_amd64.zip
unzip terraform_0.6.8_linux_amd64.zip -d /home/ubuntu/bin
rm terraform_0.6.8_linux_amd64.zip
```
  
Edit terraform.tfvars and enter credentials (statuscake and dnsimple will be posted, use your own AWS keys)
Then run terraform! [this will start instances on AWS, blah blah blah may charge you money etc]
```
terraform plan
terraform apply
```
