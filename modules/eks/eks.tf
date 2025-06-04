module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "20.33.1"
  cluster_name                    = var.cluster_name 
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  enable_irsa                     = true
  subnet_ids                      = var.subnet_ids
  vpc_id                          = var.vpc_id  
  eks_managed_node_groups = {
    default = {
      name         = var.node_group_name
      min_size     = var.node_group_min_size
      max_size     = var.node_group_max_size
      desired_size = var.node_group_desired_size
      instance_types = var.node_group_instance_types
      capacity_type  = var.node_group_capacity_type
    }
  }
}


resource "aws_eks_access_entry" "rancher_eks_user" {
  cluster_name = module.eks.cluster_name
  principal_arn  = "arn:aws:iam::920426296680:user/TFE-Usuario"
  type           = "STANDARD"
}

resource "aws_eks_access_policy_association" "admin_access_for_rancher_user" {
  cluster_name     = aws_eks_access_entry.rancher_eks_user.cluster_name
  principal_arn    = aws_eks_access_entry.rancher_eks_user.principal_arn
  policy_arn       = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
  access_scope {
    type = "cluster"
  }
  depends_on = [aws_eks_access_entry.rancher_eks_user]
}

resource "aws_eks_access_policy_association" "clusteradmin_access_for_rancher_user" {
  cluster_name     = aws_eks_access_entry.rancher_eks_user.cluster_name
  principal_arn    = aws_eks_access_entry.rancher_eks_user.principal_arn
  policy_arn       = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  access_scope {
    type = "cluster"
  }
  depends_on = [aws_eks_access_entry.rancher_eks_user]
}

