resource "aws_route_table" "rt_impresso" {
  vpc_id = aws_vpc.dev-impresso.id

  route {
    cidr_block = aws_vpc.dev-impresso.cidr_block
    gateway_id = aws_internet_gateway.dev-impresso-igw.id
  }

  tags = {
    Name = "${var.env}-rt_impresso"
  }
}

