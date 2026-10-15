variable "project_name" {
  type = string
}

variable "db_secret_arn" {
  type = string
}

variable "backend_repository_url" {
  type = string
}

variable "frontend_repository_url" {
  type = string
}

variable "db_host" {
  type = string
}

variable "db_name" {
  type = string
}

variable "region" {
  type = string
}

variable "private_subnet_1" {
  type = string
}

variable "private_subnet_2" {
  type = string
}

variable "backend_security_group_id" {
  type = string
}

variable "frontend_security_group_id" {
  type = string
}

variable "alb_target_group_arn" {
  type = string
}