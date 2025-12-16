variable "alb_security_name" {
    type = string
    description = "security name of alb"
    


}

variable "alb_description" {
    type = string
    description = "describe role of alb security group"
    
}

variable "vpc_id" {
}

variable "http_port" {
    type = number
    description = "http port"
    
}

variable "https_port" {
    type = number
    description = "https port"
    
}

variable "container_port" {
}

variable "anywhere_cidr_block" {
    type = string
    
}

variable "ecs_security_name" {
    type = string
    description = "security group name of ecs task"
    


}

variable "ecs_description" {
    type = string
    description = "describe role of ecs security group"
    
}