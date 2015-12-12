# arc204-iac

### Getting Started

Create cloud9 workspace: http://c9.io 

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
