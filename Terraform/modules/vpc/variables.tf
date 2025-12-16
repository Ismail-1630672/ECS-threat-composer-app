variable "project_name" {
    type = string
    description = "Name of project"
    
    
}


variable "vpc_cidr" {
    type = string
    description = "The IP range to use for the VPC"
    
    
}

variable "public_subnet1_cidr" {
    type = string
    description = "The IP range for the first public subnet"
    
    
}

variable "public_subnet2_cidr" {
    type = string
    description = "The IP range for the second public subnet"
    
    
}

