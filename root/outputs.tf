output "github_actions_role_arn" {
  value = module.cicd.github_actions_role_arn
}

output "app_url" {
  value = "http://${module.alb.alb_dns_name}"
}