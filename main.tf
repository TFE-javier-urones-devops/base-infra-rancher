module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  availability_zones   = var.availability_zones
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
}

module "eks" {
  source     = "./modules/eks"
  subnet_ids = module.vpc.private_subnet_ids
  vpc_id     = module.vpc.vpc_id
  cluster_name = var.cluster_name
  node_group_instance_types = var.node_group_instance_types
  node_group_min_size       = var.node_group_min_size
  node_group_max_size       = var.node_group_max_size
  node_group_desired_size   = var.node_group_desired_size
  node_group_name           = var.node_group_name
  node_group_capacity_type  = var.node_group_capacity_type
}