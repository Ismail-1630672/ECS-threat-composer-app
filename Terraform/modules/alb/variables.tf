variable "alb_name" {
    type = string
}

variable "alb_security_group_id" {
}

variable "public_subnet1_id" {
}

variable "public_subnet2_id" {
}

variable "alb_target_name" {
    type = string
}

variable "target_type" {
    type = string
}

variable "container_port" {
}

variable "http_port" {
}

variable "http_protocol" {
    type = string
}

variable "vpc_id" {
}

variable "https_port" {
}

variable "https_protocol" {
    type = string
}

variable "certificate_arn" {
}

