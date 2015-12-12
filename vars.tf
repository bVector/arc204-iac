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

variable "aws_region" {
  description = "AWS region to launch servers."
  default = "us-west-2"
}

variable "key_name" {
  description = "Name of the keypair to use in EC2."
  default = "terraform"
}

variable "key_path" {
  descriptoin = "Path to your private key."
  default = "~/.ssh/id_rsa"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-b1cf19c6"
    us-east-1 = "ami-de7ab6b6"
    us-west-1 = "ami-3f75767a"
    us-west-2 = "ami-21f78e11"
  }
}