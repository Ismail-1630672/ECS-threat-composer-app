#define security group for application load balancer (alb)
resource "aws_security_group" "alb_security_group" {
    name = var.alb_security_name
    description = var.alb_description
    vpc_id = var.vpc_id


#traffic coming in 
    ingress {
        protocol = "tcp"
        from_port = var.http_port
        to_port = var.http_port
        cidr_blocks = [var.anywhere_cidr_block]

    }

    ingress {
        protocol = "tcp"
        from_port = var.https_port
        to_port = var.https_port
        cidr_blocks = [var.anywhere_cidr_block]

    }

    #outgoing traffic

    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = [var.anywhere_cidr_block]
    }
}

#define security group for traffic coming to container/task of ecs cluster from alb
resource "aws_security_group" "ecs_security_group" {
    name = var.ecs_security_name
    description = var.ecs_description
    vpc_id = var.vpc_id

    ingress {
        from_port = var.container_port
        to_port =  var.container_port
        protocol = "tcp"
        security_groups = [aws_security_group.alb_security_group.id]
    }

    

    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = [var.anywhere_cidr_block]
    }



}
