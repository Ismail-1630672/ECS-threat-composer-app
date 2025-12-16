variable "project_name" {
    type = string
    description = "Name of project"
    default = "ECS-project"
    
}


variable "vpc_cidr" {
    type = string
    description = "The IP range to use for the VPC"
    default = "10.0.0.0/16"
    
}

variable "public_subnet1_cidr" {
    type = string
    description = "The IP range for the first public subnet"
    default = "10.0.1.0/24"
    
}

variable "public_subnet2_cidr" {
    type = string
    description = "The IP range for the second public subnet"
    default = "10.0.2.0/24"
    
}



variable "alb_security_name" {
    type = string
    description = "security name of alb"
    default = "alb security group"


}

variable "alb_description" {
    type = string
    description = "describe role of alb security group"
    default = "allow inbound traffic from anywhere to the alb"
}



variable "http_port" {
    type = number
    description = "http port"
    default = 80
}

variable "https_protocol" {
    type = string
    default = "HTTPS"
}



variable "https_port" {
    type = number
    description = "https port"
    default = 443
}

variable "anywhere_cidr_block" {
    type = string
    default = "0.0.0.0/0"
}

variable "ecs_security_name" {
    type = string
    description = "security group name of ecs task"
    default = "ecs task security group"


}

variable "ecs_description" {
    type = string
    description = "describe role of ecs security group"
    default = "allow inbound traffic only from the alb"
}

variable "ecr_repo_name" {
    type = string 
    description = "ECR repo name"
    default = "my_ecr_repo"
}

variable "iam_user_name" {
    type = string
    description = "iam username"
    default = "ecs_user"
}

variable "cluster_name" {
    type = string
    default = "ismail_cluster"
}

variable "family_name" {
    type = string
    default = "ismail_task_definition"
}

variable "my_cpu" {
    type = string
    default = "1024"
}

variable "my_memory" {
    type = string
    default = "2048"
}

variable "ecs_role" {
    type = string
    default = "ecsTaskExecutionRole"
    
}

variable "container_name" {
    type = string
    default = "Ismail_container"
}

variable "container_port" {
    type = number
    default = 3000
}

variable "service_name" {
    type = string
    default = "Ismail-service"
}

variable launch_type {
    type = string
    default = "FARGATE"
}

variable desired_tasks {
    type = number
    default = 3
}

variable "alb_name" {
    type = string
    default = "Ismail-load-balancer"
}

variable "alb_target_name" {
    type = string
    default = "Ismail-target-group"
}

variable "target_type" {
    type = string
    default = "ip"
}



variable "http_protocol" {
    type = string
    default = "HTTP"
}

variable "domain_name" {
    type = string
    default = "app.ecs-ismail.com"
}

