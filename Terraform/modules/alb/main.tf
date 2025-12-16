resource "aws_lb" "application_lb" {
    name = var.alb_name
    load_balancer_type = "application"
    security_groups = [var.alb_security_group_id]
    subnets = [var.public_subnet1_id,var.public_subnet2_id]
    
}

resource "aws_lb_target_group" "target_group" {
    name = var.alb_target_name 
    target_type = var.target_type 
    port = var.container_port
    protocol = var.http_protocol
    vpc_id = var.vpc_id

    #ensures traffic is routed only to healthy targets
    health_check {
      enabled = true 
      interval = 300
      path = "/"
      timeout = 60
      matcher = 200
      healthy_threshold = 5
      unhealthy_threshold = 5

    }

    #terraform will create a new resource before destroying the old one
    lifecycle {
      create_before_destroy = true
    }
}

#creating a listener on port 80 with redirect to port 443 action
resource "aws_lb_listener" "http_listener" {
    load_balancer_arn = aws_lb.application_lb.arn 
    port = var.http_port
    protocol = var.http_protocol

    default_action {
      type = "redirect"
      
      redirect {
        port = var.https_port
        protocol = var.https_protocol
        status_code = "HTTP_301"
      }

      
    }

    
}

#now define a listener on port 443 which forwards to the target group
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.application_lb.arn
  port = var.https_port
  protocol = var.https_protocol
  certificate_arn = var.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn 
  }
}