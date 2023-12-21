resource "aws_ecs_cluster" "app" {
  
}

resource "aws_cloudwatch_log_group" "api" {
  //name = "${var.app_name}-${var.environment}-api"
  name = "${var.app_name}-api"
}


resource "aws_ecs_task_definition" "impresso-api" {
  family = "impresso-node-api"
  container_definitions = <<DEFINITION
  [
    {
        "name":,
        "image":,
        "essential": true,
        "portMappings": [
            {
                "containerPort":3000
                "hostPort":3000
            }
        ],
        "memory": 512,
        "cpu": 256,
        "environment": ,
        "secrets":,
        "logConfiguration": {
            "logDriver": "awslogs"
            "options": {
                "awslogs-group":,
                "awslog-region":,
                "awslog-stream-prefix": "ecs
            }
        }
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  memory = 512
  cpu = 256
  execution_role_arn = aws_iam_role.ecs_task_definition.arn
}


resource "aws_ecs_service" "impresso-api" {
  name = 
  cluster = aws_ecs_cluster.app.id
  task_definition = aws_ecs_task_definition.api.arn
  launch_type = "FARGATE"
  desired_count = 2
  deployment_maximum_percent = 300
  deployment_minimum_healthy_percent = 100

  load_balancer {
    target_group_arn = aws_lb_target_group.api.arn
    container_name = aws_ecs_task_definition.api.family
    container_port = 3000
  }

  network_configuration {
    subnets = [

    ]
    assign_public_ip = true
  }


}