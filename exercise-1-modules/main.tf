terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  cidr_block = "10.0.0.0/16"
  azs        = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "vpc" {
  source = "./modules/vpc"
  cidr   = local.cidr_block
}

module "subnets" {
  source  = "./modules/subnets"
  vpc_id  = module.vpc.vpc_id
  azs     = local.azs
  subnets = var.subnets
}

module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami                 = data.aws_ami.latest_amazon_linux.id
  instance_type       = var.instance_type
  subnet_id           = module.subnets.subnet_ids[0]
  security_group_ids  = [module.vpc.default_sg]
}
