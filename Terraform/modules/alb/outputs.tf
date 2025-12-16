output "alb_target_group" {
    value = aws_lb_target_group.target_group.arn
}

output "alb_arn" {
    value = aws_lb.application_lb.arn
}