terraform {
  cloud {
    organization = "tf-class-september-20"

    workspaces {
      name = "infra-subnet"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0bb08df1093ea4c4f"
}

variable "subnets" {
  type = map(object({
    cidr_block = string
  }))
  default = {}
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}