resource "aws_subnet" "nat_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.nat_cidr.vpc_id
  cidr_block = "172.10.20.0/27"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "nat_subnet_1"
  }
}

resource "aws_subnet" "eks_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_cidr.vpc_id
  cidr_block = "172.10.11.0/25"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "eks_subnet_1"
  }
}

resource "aws_subnet" "eks_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_cidr.vpc_id
  cidr_block = "172.10.11.128/25"
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "eks_subnet_2"
  }
}

resource "aws_subnet" "eks_frontend_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.frontend_cidr.vpc_id
  cidr_block = "172.10.12.0/25"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "eks_frontend_subnet_1",
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

resource "aws_subnet" "eks_frontend_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.frontend_cidr.vpc_id
  cidr_block = "172.10.12.128/25"
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "eks_frontend_subnet_2",
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

resource "aws_subnet" "eks_node_group_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.node_group_cidr.vpc_id
  cidr_block = "172.10.13.0/25"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "eks_node_group_subnet_1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "eks_node_group_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.node_group_cidr.vpc_id
  cidr_block = "172.10.13.128/25"
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "eks_node_group_subnet_2"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}