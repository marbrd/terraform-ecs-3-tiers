variable "data_subnet_1" {
    description = "Bloc CIDR of the first data subnet"
    type        = string
}

variable "data_subnet_2" {
    description = "Bloc CIDR of the second data subnet"
    type        = string
}

variable "vpc_id" {
    description = "ID of the VPC"
    type        = string
}

variable "db_username" {
  type = string
}

variable "db_sg_id" {
  description = "ID of the security group for the RDS instance"
  type        = string
}