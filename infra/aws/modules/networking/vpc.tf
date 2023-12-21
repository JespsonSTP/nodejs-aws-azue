//vpc

resource "aws_vpc" "dev-impresso" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "dev-impresso_vpc"
  }
}

resource "aws_internet_gateway" "dev-impresso-igw" {
  vpc_id = aws_vpc.dev-impresso.id
}




