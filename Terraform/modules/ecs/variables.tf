variable "cluster_name" {
    type = string
    
}

variable "family_name" {
    type = string
}

variable "my_cpu" {
    type = string
}

variable "my_memory" {
    type = string
}

variable "ecs_role" {
    type = string

}

variable "container_name" {
    type = string
}

variable "container_port" {
    type = number
}

variable "service_name" {
    type = string
}

variable launch_type {
    type = string
}

variable desired_tasks {
    type = number
}


variable "public_subnet1_id" {
}

variable "public_subnet2_id" {
}

variable "ecs_security_group_id" {
}

variable "alb_target_group" {
}