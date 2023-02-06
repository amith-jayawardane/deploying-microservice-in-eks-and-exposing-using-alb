resource "aws_eks_fargate_profile" "eks_fargate_profile" {
  cluster_name           = aws_eks_cluster.frontend_cluster.name
  fargate_profile_name   = "frontend-fargate-profile"
  pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
  subnet_ids             = [var.eks_frontend_subnet_1, var.eks_frontend_subnet_2]

  selector {
    namespace = "frontend"
  }
}