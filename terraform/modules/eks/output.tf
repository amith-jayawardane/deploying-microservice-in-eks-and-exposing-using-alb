output "frontend-eks-cluster-endpoint" {
  value = aws_eks_cluster.frontend_cluster.endpoint
}

output "eks-kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.frontend_cluster.certificate_authority[0].data
}