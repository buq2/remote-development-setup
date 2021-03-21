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
  public_key = file("id_rsa.pub")
}

resource "aws_instance" "remote-dev-environment" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "remote-dev-environment-deployer-key"
  tags = {
    Name = "remote-dev-environment"
  }
}

