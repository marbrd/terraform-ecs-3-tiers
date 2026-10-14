variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "project-ecs-3tiers"
}

variable "db_username" {
  type = string
}

variable "github_repo" {
  type = string
}