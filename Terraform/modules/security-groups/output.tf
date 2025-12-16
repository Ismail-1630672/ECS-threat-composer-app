output "alb_security_group_id" {
    description = "id of alb security group"
    value = aws_security_group.alb_security_group.id 
}

output "ecs_security_group_id" {
    description = "id of ecs security group"
    value = aws_security_group.ecs_security_group.id 
}