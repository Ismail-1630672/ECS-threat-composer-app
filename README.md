# Deployment Of Amazon Threat-Composer Application On AWS ECS Fargate

# Project Overview
This project showcases the end-to-end deployment of the Amazon threat-composer application on AWS ECS Fargate using modern DevOps practices.

Overview:
* The application was containerised using Docker.
* Container image was stored in Amazon ECR.
* AWS ECS Fargate ran the containerised application without managing servers.
* Infrastructure was provisioned using Terraform.
* Implemented CI/CD pipelines via GitHub actions for automated build and deployment.

# Architecture

![image alt](https://github.com/Ismail-1630672/ECS-threat-composer-app/blob/main/ECS.png?raw=true)

Key features:
* Route 53 hosted zone to route traffic from custom domain (app.ecs-ismail.com) to application load balancer (ALB).
* AWS certificate manager (ACM) used to provision an SSL certificate, enabling encrypted HTTPS access to app.ecs-ismail.com.
* ALB used to route incoming HTTP/HTTPS traffic to ECS tasks across multiple availability zones, improving scalability and availability.














