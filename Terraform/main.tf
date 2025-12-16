module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
    vpc_cidr = var.vpc_cidr
    public_subnet1_cidr = var.public_subnet1_cidr
    public_subnet2_cidr = var.public_subnet2_cidr
    
}

module "security_group" {
    source = "./modules/security-groups"
    vpc_id = module.vpc.vpc_id
    http_port = var.http_port
    https_port = var.https_port
    container_port = var.container_port
    anywhere_cidr_block = var.anywhere_cidr_block
    alb_security_name = var.alb_security_name
    alb_description = var.alb_description 
    ecs_security_name = var.ecs_security_name
    ecs_description = var.ecs_description

}

module "ecr_repo" {
    source = "./modules/ecr"
    ecr_repo_name = var.ecr_repo_name
    iam_user_name = var.iam_user_name
    


}

module "ecs" {
    source = "./modules/ecs"
    cluster_name = var.cluster_name
    family_name = var.family_name
    my_cpu = var.my_cpu
    my_memory = var.my_memory
    ecs_role = var.ecs_role
    container_name = var.container_name
    container_port = var.container_port
    service_name = var.service_name
    launch_type = var.launch_type
    desired_tasks = var.desired_tasks
    ecs_security_group_id = module.security_group.ecs_security_group_id
    public_subnet1_id = module.vpc.public_subnet1_id
    public_subnet2_id = module.vpc.public_subnet2_id
    alb_target_group = module.alb.alb_target_group

}

module "alb" {
    source = "./modules/alb"
    alb_name = var.alb_name
    alb_security_group_id = module.security_group.alb_security_group_id
    public_subnet1_id = module.vpc.public_subnet1_id
    public_subnet2_id = module.vpc.public_subnet2_id
    vpc_id = module.vpc.vpc_id
    http_protocol = var.http_protocol
    http_port = var.http_port
    alb_target_name = var.alb_target_name
    container_port = var.container_port
    target_type = var.target_type
    https_port = var.https_port
    https_protocol = var.https_protocol

}

module "route53" {
    source = "./modules/route53"
    domain_name = var.domain_name
    alb_dns_name = module.alb.alb_dns_name
    alb_zone_id = module.alb.alb_zone_id

}
