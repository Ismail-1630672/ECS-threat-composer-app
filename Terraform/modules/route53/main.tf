data "aws_route53_zone" "hosted_zone" {
    name = var.domain_name
     
}

#define an A record (alias) inside hosted zone which points domain name to the ALB endpoint. 
resource "aws_route53_record" "app" {
    zone_id = data.aws_route53_zone.hosted_zone.zone_id
    name = var.domain_name
    type = "A"

    #switch traffic from alb's dns name to domain name app.ecs-ismail.com
    alias {
      name = var.alb_dns_name
      zone_id = var.alb_zone_id
      evaluate_target_health = true
    }

}
  
