resource "aws_subnet" "_sub1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.dev-impresso.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

}
resource "aws_subnet" "sub2" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.dev-impresso.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

}

resource "aws_subnet" "_sub3" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.dev-impresso.id
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

}

