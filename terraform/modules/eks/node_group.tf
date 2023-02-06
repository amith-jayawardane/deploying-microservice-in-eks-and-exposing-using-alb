resource "aws_eks_node_group" "frontend_node_group" {
  cluster_name    = aws_eks_cluster.frontend_cluster.name
  node_group_name = "frontend_node_group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = [var.eks_node_group_subnet_1, var.eks_node_group_subnet_2]
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}