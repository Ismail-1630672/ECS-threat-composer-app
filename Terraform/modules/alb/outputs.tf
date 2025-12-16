output "alb_target_group" {
    value = aws_lb_target_group.target_group.arn
}

output "alb_arn" {
    value = aws_lb.application_lb.arn
}

output "alb_dns_name" {
    value = aws_lb.application_lb.dns_name
}

output "alb_zone_id" {
    value = aws_lb.application_lb.zone_id
}