# Create VPC
resource "aws_vpc" "impresso-blue" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "dev-impresso_vpc"
  }
}

# Create Internet Gateway for public subnet
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.impresso-blue.id
}

/*
# Attach Internet Gateway to public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  subnet_ids = [aws_subnet.public_subnet.id]
}

*/