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
* ALB used to route and distribute incoming HTTP/HTTPS traffic to multiple ECS tasks.
* ECS tasks deployed across multiple availability zones for high availability.
* ECS tasks run behind the ALB to to prevent direct access of containers by users of the internet.

# Directory structure

```
└── ./
    ├── .github/
    │   └── workflows/
    │       ├── apply.yml
    │       ├── destroy.yml
    │       ├── plan.yml
    │       └── push-image.yml
    │
    ├── app/
    │   └── Dockerfile
    │
    ├── Terraform/
    │   ├── modules/
    │   │   ├── acm/
    │   │   ├── alb/
    │   │   ├── ecr/
    │   │   ├── ecs/
    │   │   ├── route53/
    │   │   ├── security-groups/
    │   │   └── vpc/              
    │   │
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── provider.tf
    │   └── variables.tf
    │
    └── README.md
```

# Docker
* Implemented multi-stage docker builds to produce lightweight and efficient container images.
* Levereged docker layer caching to speed up rebuilds.
* Ran container as non-root user to enhance application security.

# Terraform
* Used modular Terraform design for AWS resources (VPC,ECS,ALB,ECR,ACM,Route53 etc), improving maintainability and scalability
* Terraform state (.tfstate) stored in a remote S3 backend enhancing security.
* Enabled state locking to prevent state file corruption. 

# CI/CD
* Implemented separate GitHub Actions pipelines for Docker image builds, Terraform planning, and Terraform deployment.
* Used trigger-based workflows with workflow_dispatch for flexible and controlled deployments.
* Integrated GitHub Actions with AWS using OIDC, eliminating static AWS credentials.
* Used short-lived, automatically rotating credentials to follow AWS security best practices.

# Workflow runs

![image alt]()



  





















