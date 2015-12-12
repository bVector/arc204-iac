variable "access_key" {
    description = "AWS access key."
}

variable "secret_key" {
    description = "AWS secret key."
}

variable "statuscake_user" {
	description = "statuscake username"
}

variable "statuscake_key" {
	description = "statuscake apikey"
}

variable "firstname" {
	description = "your first name (or handle, keep it simple)"
}

variable "dnsimple_token"{
  description = "dnsimple api token"
}
variable "dnsimple_email"{
  description = "dnsimple email address"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default = "us-west-2"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

variable "key_name" {
  description = "Name of the keypair to use in EC2."
  default = "terraform"
}

variable "pubkey_path" {
  description = "Path to your private key."
  default = "~/.ssh/id_rsa.pub"
}

variable "privkey_path" {
  description = "Path to your private key."
  default = "~/.ssh/id_rsa"
}

# Ubuntu Precise 14.04 LTS (x64)
variable "aws_amis" {
  default = {
    us-west-2 = "ami-5189a661"
  }
}