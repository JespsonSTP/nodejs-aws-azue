# Attach Internet Gateway to public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.impresso-blue.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Associate each public subnet with the public route table
resource "aws_route_table_association" "public_subnet_associationa" {
  subnet_id      = aws_subnet.private_subneta.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_subnet_associationb" {
  subnet_id      = aws_subnet.private_subnetb.id
  route_table_id = aws_route_table.public_route_table.id
}