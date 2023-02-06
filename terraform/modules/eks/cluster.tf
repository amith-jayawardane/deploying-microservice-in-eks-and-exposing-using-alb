resource "aws_eks_cluster" "frontend_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks-role.arn

  enabled_cluster_log_types = ["api", "audit"]

  vpc_config {
    subnet_ids = [var.eks_subnet_1, var.eks_subnet_2]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.frontend-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.frontend-AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.eks_log_group,
    aws_iam_role_policy_attachment.AmazonEKSFargatePodExecutionRolePolicy,

  ]
}