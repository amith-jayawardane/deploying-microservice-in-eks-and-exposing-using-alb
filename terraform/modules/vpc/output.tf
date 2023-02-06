output "eks_subnet_1" {
  value = aws_subnet.eks_subnet_1.id
}

output "eks_subnet_2" {
  value = aws_subnet.eks_subnet_2.id
}

output "eks_frontend_subnet_1" {
  value = aws_subnet.eks_frontend_subnet_1.id
}

output "eks_frontend_subnet_2" {
  value = aws_subnet.eks_frontend_subnet_2.id
}

output "eks_node_group_subnet_1" {
  value = aws_subnet.eks_node_group_subnet_1.id
}

output "eks_node_group_subnet_2" {
  value = aws_subnet.eks_node_group_subnet_2.id
}