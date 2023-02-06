resource "aws_route_table" "internet_route_table" {
  vpc_id = aws_vpc.frontend_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "internet_route_table"
  }
}

resource "aws_route_table" "frontend_node_group_route_table" {
  vpc_id = aws_vpc.frontend_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "frontend_node_group_route_table"
  }
}

resource "aws_route_table_association" "internet_route_table_subnet_association" {
  subnet_id      = aws_subnet.nat_subnet_1.id
  route_table_id = aws_route_table.internet_route_table.id
}

resource "aws_route_table_association" "frontend_node_group_route_table_subnet_association_1" {
  subnet_id      = aws_subnet.eks_node_group_subnet_1.id
  route_table_id = aws_route_table.frontend_node_group_route_table.id
}

resource "aws_route_table_association" "frontend_node_group_route_table_subnet_association_2" {
  subnet_id      = aws_subnet.eks_node_group_subnet_2.id
  route_table_id = aws_route_table.frontend_node_group_route_table.id
}

resource "aws_route_table_association" "eks_frontend_subnet_route_table_subnet_association_1" {
  subnet_id      = aws_subnet.eks_frontend_subnet_1.id
  route_table_id = aws_route_table.frontend_node_group_route_table.id
}

resource "aws_route_table_association" "eks_frontend_subnet_route_table_subnet_association_2" {
  subnet_id      = aws_subnet.eks_frontend_subnet_2.id
  route_table_id = aws_route_table.frontend_node_group_route_table.id
}