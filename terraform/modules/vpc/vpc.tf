resource "aws_vpc" "frontend_vpc" {
  cidr_block = "172.10.10.0/24"
}

resource "aws_vpc_ipv4_cidr_block_association" "frontend_cidr" {
  vpc_id     = aws_vpc.frontend_vpc.id
  cidr_block = "172.10.11.0/24"
}

resource "aws_vpc_ipv4_cidr_block_association" "nat_cidr" {
  vpc_id     = aws_vpc.frontend_vpc.id
  cidr_block = "172.10.20.0/27"
}