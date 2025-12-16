resource "aws_ecs_cluster" "cluster" {
    name = var.cluster_name
}

#fetch information of the ecstaskexeuctionrole
data "aws_iam_role" "ecs_task_execution_role" {
    name = var.ecs_role
}


resource "aws_ecs_task_definition" "task" {
    #infrastruction requirements
    family = var.family_name
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    cpu = var.my_cpu
    memory = var.my_memory
    execution_role_arn = data.aws_iam_role.ecs_task_execution_role.arn

    #container details
    container_definitions = jsonencode([
        {
            "cpu" : 1024,
            "memory" : 2048,
            "image" : "972067303716.dkr.ecr.eu-west-2.amazonaws.com/my_ecr_repo:latest"
            "name" : "${var.container_name}",
            "portMappings" : [
                {
                    "containerPort" : "${var.container_port}",
                    "hostPort" : 3000,
                    "protocol" : "tcp",
                    "name" : "container-port",
                    "appProtocol" : "http"
                }
            ]
        }
    ])
}

resource "aws_ecs_service" "service" {
    name = var.service_name
    cluster = aws_ecs_cluster.cluster.id
    task_definition = aws_ecs_task_definition.task.arn
    desired_count = var.desired_tasks
    launch_type = var.launch_type
    

    network_configuration {
      subnets = [var.public_subnet1_id,var.public_subnet2_id]
      security_groups = [var.ecs_security_group_id]
      assign_public_ip = true 
    }

    load_balancer {
      target_group_arn = var.alb_target_group
      container_name = var.container_name
      container_port = var.container_port
    }
}