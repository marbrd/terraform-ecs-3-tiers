resource "aws_ecr_repository" "backend" {
  name = "backend"
  force_delete = true
}

resource "aws_ecr_repository" "frontend" {
  name = "frontend"
  force_delete = true
}