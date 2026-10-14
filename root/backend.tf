terraform {
  backend "s3" {
    bucket = "backend-bucket-marouane"
    key    = "terraform-ecs-3-tiers/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}