terraform {
  required_version = "1.16.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "aws_availability_zones" "az" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  region = var.region
  tags = {
    Name = var.project_name
  }
}

resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = { 
    Name = "${var.project_name}-subnet-public${count.index + 1}-${data.aws_availability_zones.az.names[count.index]}" 
  }
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index + 8)
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = { 
    Name = "${var.project_name}-subnet-private${count.index + 1}-${data.aws_availability_zones.az.names[count.index]}" 
  }
}