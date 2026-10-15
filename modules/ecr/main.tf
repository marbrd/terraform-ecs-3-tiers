resource "aws_ecr_repository" "backend" {
  name = "project-ecs-3tiers-backend"
  force_delete = true
}

resource "aws_ecr_repository" "frontend" {
  name = "project-ecs-3tiers-frontend"
  force_delete = true
}