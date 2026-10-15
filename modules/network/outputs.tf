output "private_subnet_1" {
  value = aws_subnet.private[0].id
}

output "private_subnet_2" {
  value = aws_subnet.private[1].id
}

output "public_subnet_1" {
  value = aws_subnet.public[0].id
}

output "public_subnet_2" {
  value = aws_subnet.public[1].id
}

output "data_subnet_1" {
  value = aws_subnet.data[0].id
}

output "data_subnet_2" {
  value = aws_subnet.data[1].id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "frontend_sg_id" {
  value = aws_security_group.frontend.id
}

output "backend_sg_id" {
  value = aws_security_group.backend.id
}

output "db_sg_id" {
  value = aws_security_group.db.id
}