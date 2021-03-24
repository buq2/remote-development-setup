terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "ami" {
  type = string
}

variable "region" {
  type = string
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "remote-dev-environment-deployer-key"
  # Use ~/.ssh/id_rsa.pub if you did not generate the keypair
  public_key = file("secrets/id_rsa.pub")
}

resource "aws_instance" "remote-dev-environment" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "remote-dev-environment-deployer-key"
  tags = {
    Name = "remote-dev-environment"
  }

  // Instead of `user_data` we could use
  // provisioner "remote-exec" {
  //     script = "to_server/user_data.sh"  
  // }
  user_data = file("to_server/user_data.sh")
  vpc_security_group_ids = [aws_security_group.allow_wireguard.id]
}

resource "aws_security_group" "allow_wireguard" {
  name        = "allow_wireguard"
  description = "Allow wireguard inbound traffic"

  ingress {
    description = "Wireguard to VPC"
    from_port   = 1294
    to_port     = 1294
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH to VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_wireguard"
  }
}
