//security group for load balancer
resource "aws_security_group" "load_balancer_sg" {
  //allow http traffic from anywhere
  ingress {
    from_port = 80
    to_port = 80
    protocol = tcp
    cidr_blocks = [ "0.0.0.0/0" ] #allow traffic from everywhere
  }

  //allow https traffic from anywhere
  ingress {
    from_port = 443
    to_port = 443
    protocol = tcp
    cidr_blocks = [ "0.0.0.0/0" ] #allow traffic from everywhere
  }

    //allow any protocol and traffic to go out
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

//security group for container
resource "aws_security_group" "container_sg" {
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = [aws_security_group.load_balancer_security_group.id]
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}