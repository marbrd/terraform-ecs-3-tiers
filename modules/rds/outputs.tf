output "db_host" {
  value = aws_db_instance.default.address
}

output "db_name" {
  value = aws_db_instance.default.db_name
}

output "db_secret_arn" {
  value = aws_db_instance.default.master_user_secret[*].secret_arn
}