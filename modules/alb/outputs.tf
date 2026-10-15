output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "frontend_target_group_arn" {
  value      = aws_lb_target_group.frontend.arn
  depends_on = [aws_lb_listener.http]
}