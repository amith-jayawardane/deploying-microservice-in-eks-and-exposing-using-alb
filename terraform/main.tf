module "frontend_vpc" {
  source = "./modules/vpc"
}

module "frontend_eks_cluster" {
  source = "./modules/eks"
  cluster_name = "frontend-cluster"
  eks_subnet_1 = module.frontend_vpc.eks_subnet_1
  eks_subnet_2 = module.frontend_vpc.eks_subnet_2
  eks_frontend_subnet_1 = module.frontend_vpc.eks_frontend_subnet_1
  eks_frontend_subnet_2 = module.frontend_vpc.eks_frontend_subnet_2
}