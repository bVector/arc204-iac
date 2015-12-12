# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "arc204sg" {
  name        = "arc204sg"
  description = "Created by arc204 terraform state"
  vpc_id = "${aws_vpc.default.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    tf = "arc204"
    }
}

resource "aws_key_pair" "auth" {
  key_name   = "terraform"
  public_key = "${file(var.pubkey_path)}"
}

resource "aws_instance" "web" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
    # The default username for our AMI
    user = "ubuntu"
    private_key = "${file(var.privkey_path)}"
  }

  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.default.id}"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${lookup(var.aws_amis, var.aws_region)}"

  # The name of our SSH keypair we created above.
  key_name = "${aws_key_pair.auth.id}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.arc204sg.id}"]

  # We run a remote provisioner on the instance after creating it.
  # In this case, we just install nginx and start it. By default,
  # this should be on port 80
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start"
    ]
  }
  tags {
    tf = "arc204"
    }
}

resource "statuscake_test" "web" {
    website_name = "arc204-${var.firstname} ${aws_instance.web.public_dns}"
    website_url = "${aws_instance.web.public_dns}"
    test_type = "HTTP"
    check_rate = 300
}

resource "dnsimple_record" "web" {
  domain = "nsl.ninja"
  name = "${var.firstname}"
  value = "${aws_instance.web.public_ip}"
  type = "A"
  ttl = 3600
}