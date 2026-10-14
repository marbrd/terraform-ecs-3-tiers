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

module "network" {
  source = "../modules/network"
  region = var.region
  project_name = var.project_name
}

module "rds" {
  source = "../modules/rds"
  private_subnet_1 = module.network.private_subnet_1
  private_subnet_2 = module.network.private_subnet_2
  vpc_id = module.network.vpc_id
  db_username = var.db_username
  db_password = var.db_password
  db_sg_id = module.network.db_sec_group_id
}