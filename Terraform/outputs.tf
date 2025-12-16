output "vpc_id" {
    value = module.vpc.vpc_id
}

output "repository_url" {
    description = "repository url"
    value = module.ecr_repo.repository_url
}

output "user_access_key" {
    value = module.ecr_repo.user_access_key

}

output "user_secret_access_key" {
    value = module.ecr_repo.user_secret_access_key
    sensitive = true 
}

output "ecs_security_group_id" {
    value = module.security_group.ecs_security_group_id
}

output "public_subnet1_id" {
    value = module.vpc.public_subnet1_id
}

output "public_subnet2_id" {
    value = module.vpc.public_subnet2_id
}

output "alb_security_group_id" {
    value = module.security_group.alb_security_group_id
}

output "alb_target_group" {
    value = module.alb.alb_target_group
}

output "alb_arn" {
    value = module.alb.alb_arn
}




