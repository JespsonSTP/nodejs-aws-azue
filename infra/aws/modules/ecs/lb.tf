resource "aws_lb" "application_load_balancer" {
    name = "dev_vpc_impresso_nodejs"
    load_balancer_type = "application"
    subnets = [

    ]
    security_groups = [ aws_security_group.load_balancer_sg.id ]
}

resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code = "404"
    }
  }
}


resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port = 443
  protocol = "HTTPS"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code = "404"
    }
  }
}

resource "" "name" {
  
}