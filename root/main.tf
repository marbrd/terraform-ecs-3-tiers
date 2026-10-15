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
  data_subnet_1 = module.network.data_subnet_1
  data_subnet_2 = module.network.data_subnet_2
  vpc_id = module.network.vpc_id
  db_username = var.db_username
  db_sg_id = module.network.db_sg_id
}

module "ecr" {
  source = "../modules/ecr"
}

module "cicd" {
  source = "../modules/cicd"
  project_name = var.project_name
  github_repo = var.github_repo
  ecr_repository_arns = module.ecr.repository_arns
}

module "ecs" {
  source = "../modules/ecs"
  project_name = var.project_name
  db_secret_arn = module.rds.db_secret_arn
  backend_repository_url = module.ecr.backend_repository_url
  db_host = module.rds.db_host
  db_name = module.rds.db_name
  region = var.region
  private_subnet_1 = module.network.private_subnet_1
  private_subnet_2 = module.network.private_subnet_2
  security_group_id = module.network.backend_sg_id
}