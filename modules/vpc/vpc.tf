module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  cidr                 = var.vpc_cidr
  name                 = var.vpc_name
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  azs                  = var.availability_zones
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
}
