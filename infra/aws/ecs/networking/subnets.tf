# Create public subnet
resource "aws_subnet" "public_subneta" {
  vpc_id                  = aws_vpc.impresso-blue.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Change this to an available zone in your region
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnetb" {
  vpc_id                  = aws_vpc.impresso-blue.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"  # Change this to an available zone in your region
  map_public_ip_on_launch = true
}

# Create private subnet
resource "aws_subnet" "private_subneta" {
  vpc_id                  = aws_vpc.impresso-blue.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"  # Change this to an available zone in your region
}

resource "aws_subnet" "private_subnetb" {
  vpc_id                  = aws_vpc.impresso-blue.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"  # Change this to an available zone in your region
}